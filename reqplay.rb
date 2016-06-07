require 'mechanize'

  
a = Mechanize.new

a.get('http://search.ucas.com/search/results?CountryCode=3&Vac=2&AvailableIn=2016&Location=Scotland&IsFeatherProcessed=True&page=1&Feather=7&MaxResults=1000&providerids=2203') do |page|
course_page = a.click(page.link_with(:href => /course/)) do |link|
end
page.search('div.coursedetails_contact h4').each do |h4|
puts.h4.text.string
end
end