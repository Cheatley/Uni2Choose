class PagesController < ApplicationController
  def home

             # @uninames_array = ["The University of Aberdeen", "Abertay University", "University of Dundee", "The University of Edinburgh", "Edinburgh Napier University", "University of Glasgow", "Glasgow Caledonian University", "The Glasgow School of Art", "Heriot-Watt University, Edinburgh", "University of the Highlands and Islands", "The Open University", "Queen MArgaret University, Edinburgh", "Robert Gordon University", "Royal Conservatoire of Scotland", "SAE Insitute", "SRUC - Scotland's Rural College", "University of St Andrews", "The University of Stirling", "The University of Strathclyde", "University of the West of Scotland"]

require 'mechanize'
mechanize = Mechanize.new

@uninames_array = []

#page = mechanize.get('http://search.ucas.com/search/providers?CountryCode=&RegionCode=&Lat=&Lng=&Feather=&Vac=2&Query=&ProviderQuery=&AcpId=&Location=scotland&IsFeatherProcessed=True&SubjectCode=&AvailableIn=2016')
page = mechanize.get('http://search.ucas.com/search/providers?CountryCode=3&RegionCode=&Lat=&Lng=&Feather=&Vac=2&Query=&ProviderQuery=&AcpId=&Location=scotland&IsFeatherProcessed=True&SubjectCode=&AvailableIn=2016')


page.search('li.result h3').each do |h3|
  name = h3.text
  @uninames_array.push(name)
end

while next_page_link = page.at('.pager a[text()=">"]')
  page = mechanize.get(next_page_link['href'])

  page.search('li.result h3').each do |h3|
    name = h3.text
    @uninames_array.push(name)
  end
end

puts @uninames_array.to_s
  end
end

