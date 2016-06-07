require 'mechanize'

  
mechanize = Mechanize.new

@courses_array = []

page = mechanize.get('http://search.ucas.com/search/results?CountryCode=3&Vac=2&AvailableIn=2016&Location=Scotland&IsFeatherProcessed=false&page=1&providerids=1001')


page.search('div.coursenamearea h4').each do |h4|
puts h4.text.strip

end

while next_page_link = page.at('.pager a[text()=">"]')
  page = mechanize.get(next_page_link['href'])
  
page.search('div.coursenamearea h4').each do |h4|
    name = h4.text
    @courses_array.push(name)
    puts h4.text.strip
  end
end