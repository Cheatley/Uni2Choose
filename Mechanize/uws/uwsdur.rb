require 'mechanize'

  
mechanize = Mechanize.new

@duration_array = []

page = mechanize.get('http://search.ucas.com/search/results?CountryCode=3&Vac=2&AvailableIn=2016&Location=Scotland&IsFeatherProcessed=True&page=1&Feather=7&MaxResults=1000&providerids=2203')


page.search('div.courseinfoduration').each do |x|
puts x.text.strip

end

while next_page_link = page.at('.pager a[text()=">"]')
  page = mechanize.get(next_page_link['href'])
  
page.search('div.courseinfoduration').each do |x|
    name = x
    @duration_array.push(name)
    puts x.text.strip
  end
end