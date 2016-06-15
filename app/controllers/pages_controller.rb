class PagesController < ApplicationController


require 'mechanize'

class Scraper
    def process_unis
        @mechanize = Mechanize.new
        @unis_array = []
        page_num = 1
        next_page_link = true

        # Load initial search page
        page = @mechanize.get('http://search.ucas.com/search/providers?CountryCode=3&RegionCode=&Lat=&Lng=&Feather=&Vac=2&Query=&ProviderQuery=&AcpId=&Location=scotland&IsFeatherProcessed=True&SubjectCode=&AvailableIn=2016')

        while  next_page_link
            puts "- Scraping uni page: #{page_num}" 

            # Loops through all unis on page
            page.search('li.result').each do |uni|
                # Sets hash to store all uni data
                uni_info = {}
                uni_name = uni.search('h3').text

                uni_info[:name] = uni_name

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
            end

            # Checks if there is a next page and navigates if so
            next_page_link = page.search('.pager a[text()=">"]').first
            if(next_page_link) 
                page = @mechanize.get(next_page_link["href"])
                page_num += 1
            end
        end
    end

    # Just a function to print what has been added. Can be removed if unneeded
    def print_course_info(course_info)
        puts "--- Adding course: #{course_info[:name]}" 
        puts "---- Duration: #{course_info[:duration]}"
        puts "---- Qualification: #{course_info[:qualification]}"
        puts ""
    end

    # Removes excess spaces and new line characters from duration and qual text
    def clean_text(text)
        return text.gsub!('  ', '').gsub!("\n", '').gsub!("\r", '')
    end

    def process_inline_courses(uni)
        uni_name = uni.search('h3').text
        puts "-- Scraping #{uni_name} courses"
        courses_array = []

        # Loops through all courses, saves their info into a hash and pushes it to an array
        uni.search('.courseresult').each do |course|
            course_info = {}
            course_info[:name]          = course.search('.title').text
            course_info[:duration]      = course.search('.durationValue').text
            course_info[:qualification] = course.search('.outcomequalValue').text

            courses_array.push(course_info)
            print_course_info(course_info)
        end
        
        puts "--- Scraped #{courses_array.length} courses"
        return courses_array
    end

    def process_courses_page(course_page)
        courses_array = []
        page_num = 1
        next_page_link = true    
        
        uni_name = course_page.search('.providerinfo h3').text

        # Loops through all course pages for uni
        while next_page_link
            puts "-- Scraping #{uni_name} courses page: #{page_num}"

            # Loops through all courses and adds their info into a hash
            course_page.search('ol.resultscontainer li').each do |course|
                course_info = {}

                # Removes excess html which was interferring with text
                course.search(
                    '.courseinfoduration span, 
                     .courseinfoduration br, 
                     .courseinfooutcome span, 
                     .courseinfooutcome br').remove

                # Sets all data in hash
                course_info[:name]          = course.search('.courseTitle').text
                course_info[:duration]      = clean_text(course.search('.courseinfoduration').text)
                course_info[:qualification] = clean_text(course.search('.courseinfooutcome').text)

                # Pushes course hash to course array
                courses_array.push(course_info)
                print_course_info(course_info)
            end

            # Checks if there is a next page and navigates to it if so
            next_page_link = course_page.search('.pager a[text()=">"]').first        
            if(next_page_link) 
                course_page = @mechanize.get(next_page_link["href"])
                page_num += 1
            end
        end

        puts "--- Scraped #{courses_array.length} courses"
        return courses_array
    end
end



scraper = Scraper.new
scraper.process_unis



end