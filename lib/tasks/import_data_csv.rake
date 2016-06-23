require 'csv'

namespace :import_courses_csv do
  task :courses_data => :environment do
    csv_text = File.read("courses.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Course.create!(row.to_hash)
    end
  end
end 

namespace :import_highers_csv do
  task :highers_data => :environment do
    csv_text = File.read("highers.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Higher.create!(row.to_hash)
    end
  end
end 

namespace :import_scotlandunis_csv do
  task :scotlandunis_data => :environment do
    csv_text = File.read("scotlandunis.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      University.create!(row.to_hash)
    end
  end
end 

namespace :import_ucasletters_csv do
  task :ucasletters_data => :environment do
    csv_text = File.read("ucasletters.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Ucasletter.create!(row.to_hash)
    end
  end
end 
