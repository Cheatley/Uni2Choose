require 'mechanize'

  
mechanize = Mechanize.new

@courses_array = []

page = mechanize.get('http://search.ucas.com/search/results?Vac=2&AvailableIn=2016&IsFeatherProcessed=True&page=1&providerids=41')


page.search('div.courseinfoduration').each do |x|
puts x.text.strip
page.search('div.courseinfooutcome').each do |y|
puts y.text.strip

end

while next_page_link = page.at('.pager a[text()=">"]')
  page = mechanize.get(next_page_link['href'])
  
page.search('div.courseinfoduration').each do |x|
    name = x
    @courses_array.push(name)
    puts x.text.strip
  end
end
while next_page_link = page.at('.pager a[text()=">"]')
  page = mechanize.get(next_page_link['href'])
  
page.search('div.courseinfooutcome').each do |y|
    name = y
    @courses_array.push(name)
    puts y.text.strip
  end
end
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
end