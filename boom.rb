require 'sqlite3'
#Gem needed to pull (includes nokogiri)
require 'mechanize'


#Creating database to store tables with info from arrays  
#db = SQLite3::Database.new('uni2choose.sqlite3')    
#Creating tables to store info from arrays
#db.execute 'CREATE TABLE "su" ("uname" string(60) NOT NULL)'
#db.execute 'CREATE TABLE "suc" ("uname" string(60), "cname" string(300) NOT NULL, "ucas" string(300) NOT NULL, "duration" string(300), "qualification" string(100), "ahighers" string(500) "highers" string(500))'


#Class to run the data scrape 
class Scraper
    
    #Class that processes all Universities 
    def process_unis
        @mechanize = Mechanize.new
        @unis_array = []
        page_num = 1
        next_page_link = true
 
        # Load initial search page
        @page = @mechanize.get('http://search.ucas.com/search/providers?CountryCode=3&RegionCode=&Lat=&Lng=&Feather=&Vac=2&Query=&ProviderQuery=&AcpId=&Location=scotland&IsFeatherProcessed=True&SubjectCode=&AvailableIn=2016')
        while  next_page_link
            puts "- Scraping uni page: #{page_num}" 
            
            # Loops through all unis on page
            @page.search('li.result').each do |uni|
            
                # Sets hash to store all uni data
                uni_info = {}
                @uni_name = clean_uniname(uni.search('h3').text)
                uni_info[:name] = @uni_name
                uni_more_courses_link = uni.search('.morecourseslink a').first
                if uni_more_courses_link
                
                    # If there is a link to a courses page for the uni go to that
                    uni_info[:courses] = process_courses_page(@mechanize.get(uni_more_courses_link["href"])) 
                else
                
                    # Otherwise process all the courses on the current page for that uni
                    uni_info[:courses] = process_inline_courses(uni)
                end
                
                # Add complete uni info to array. This may also be a good place to inset the uni in the database
                @unis_array.push(uni_info)
                
                #Opening the Database created, and storing the uni_array                
                db = SQLite3::Database.open('uni2choose.sqlite3')
                db.execute "INSERT INTO su (uname) VALUES ('#{@uni_name[0..60]}')"
            end
            
            # Checks if there is a next page and navigates if so
            next_page_link = @page.search('.pager a[text()=">"]').first
            if(next_page_link) 
                @page = @mechanize.get(next_page_link["href"])
                page_num += 1
            end
        end
    end

    # Just a function to print what has been added. To test pulling correct data
    def print_course_info(course_info)
        puts "--- Adding course: #{course_info[:name]}" 
        puts "--- UCAS Number: #{course_info[:ucas]}"
        puts "---- Duration: #{course_info[:duration]}"
        puts "---- Qualification: #{course_info[:qualification]}"
    end
    
    
    # Just a function to print what has been added. To test pulling correct data
    def print_details_info(details_info)
        puts "---- link: #{details_info[:url]}"
    end
    
    # Just a function to print what has been added. To test pulling correct data
    def print_entry_info(entry_info)
        puts "---- Advanced highers: #{entry_info[:ahigh]}"
        puts "---- Highers: #{entry_info[:high]}"
        puts ""
    end 

    # Removes excess spaces and new line characters from duration and qual text
    def clean_text(text)
        return text.gsub!('  ', '').gsub!("\n", '').gsub!("\r", '')
    end
    
    #Removes apostrophe from University names     
   def clean_ucas(text)
       text.gsub!(/[()]/, "")
       
       text
   end    



    #Removes apostrophe from University names     
   def clean_uniname(text)
       text.gsub!("'", '')
       
       text
   end
   
    #Removes apostrophe from Links     
   def clean_link(a)
      a.gsub!("'", '')
      a
   end
   
    #Class that processes all courses for Universities with no more courses button      
    def process_inline_courses(uni)
        uni_name = uni.search('h3').text
        puts "-- Scraping #{uni_name} courses"
        courses_array = []
        
        # Loops through all courses, saves their info into a hash and pushes it to an array
        uni.search('.courseresult').each do |course|
            course_info = {}
            course_info[:name]          = course.search('.title').text
            course_info[:ucas]          = course.search('h4').text
            course_info[:duration]      = course.search('.durationValue').text
            course_info[:qualification] = course.search('.outcomequalValue').text

            courses_array.push(course_info)
            print_course_info(course_info)
        end
        puts "--- Scraped #{courses_array.length} courses"
        return courses_array
    end

    #Class that processes all Courses within the University selected 
    def process_courses_page(course_page)
        courses_array = []
        page_num = 1
        next_page_link = true   
        details_link = true 
        uni_name = course_page.search('.providerinfo h3').text
        
        # Loops through all course pages for uni
        while next_page_link
            puts "-- Scraping #{uni_name} courses page: #{page_num}"
            
            # Loops through all courses and adds their info into a hash
            course_page.search('ol.resultscontainer li').each do |course|
                course_info = {}
                  # Sets all data in hash
                @course_name = course.search('.courseTitle').text
                @course_name = clean_uniname(@course_name)
                course_info[:name] = @course_name
                
                # Removes excess html which was interferring with text
                course.search(
                    '.courseinfoduration span, 
                     .courseinfoduration br,
                     .coursenamearea a span, 
                     .courseinfooutcome span, 
                     .courseinfooutcome br').remove
               
              
                
                @ucas_numb = clean_ucas(course.search('.coursenamearea a').text.strip)
                @ucas_numb = @ucas_numb
                course_info[:ucas] = @ucas_numb
                
                @course_duration = clean_text(course.search('.courseinfoduration').text)
                @course_duration = clean_uniname(@course_duration)
                course_info[:duration]      = @course_duration

                @course_qual = clean_text(course.search('.courseinfooutcome').text)
                @course_qual = clean_uniname(@course_qual)
                course_info[:qualification] = @course_qual
                
                # Pushes course hash to course array
                courses_array.push(course_info)
                print_course_info(course_info)
                                   

                details_link = course.search('div.coursenamearea a').first
                    if details_link
                     
                        # If there is a link to a detail page for the course go to that
                        course_info[:detail] = process_course_details(@mechanize.get(details_link["href"])) 
                    end
            end
        
            # Checks if there is a next page and navigates to it if so
            next_page_link = course_page.search('.pager a[text()=">"]').first        
            if(next_page_link) 
                course_page = @mechanize.get(next_page_link["href"])
                page_num += 1
            end
        end
    end

    #Class that pulls the link from the course details page
    def process_course_details(course_details)
        details_array =[]
        entry_link = true
   
            details_info = {}
            
            
    
            
            # Sets all data in hash
            @details_url = course_details.search('div.coursedetails_programmeurl a')
            
            
            
            details_info[:url]  = @details_url
            
                
                
            #pushes to array, and prints
            details_array.push(details_info)
            print_details_info(details_info)
            
            entry_link = course_details.search('ul.details_tabs a').first
            if entry_link
                 
            # If there is a link to a qualification page for the course go to that
            details_info[:entry] = process_entry(@mechanize.get(entry_link["href"]))
            end 
    end
   

    def process_entry(entry_req)
        entry_array = []
        entry_info = {}
               
               
                            entry_req.search(
                    '.div.qual-group-qual span, 
                     .div.qual-group-qual br,
                     .div.qual-group-qual li').remove
              
              
                     
            # Sets all data in hash
            @ahighers = clean_link(entry_req.search('li.qual-element.qual_range').text.strip)
            entry_info[:ahigh] = @ahighers
            
            #@ahigherinfo = entry_req.search('li.qual-element.qual_req_subgrade').text.strip
            #entry_info[:ahighinfo]          = @ahighersinfo
            
           
            @highers = entry_req.search('li.qual-element.qual_req_subgrade').text.strip
            entry_info[:high]          = @highers
            
            #@highersinfo = entry_req.search('li.qual-element.qual_range').text.strip
            #entry_info[:highinfo]          = @highersinfo
            
            
            
            #Pushes to array, and prints     
            entry_array.push(entry_info)
            print_entry_info(entry_info)
            
            
           # db = SQLite3::Database.open('uni2choose.sqlite3')
            #db.execute "INSERT INTO suc (uname, cname, ucas, duration, qualification, entry) VALUES ('#{@uni_name}', '#{@course_name}', '#{@ucas_numb}', '#{@course_duration}', '#{@course_qual}', '#{@ahighers}', '#{@highers}')"
    end


scraper = Scraper.new
scraper.process_unis

end

