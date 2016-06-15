require 'csv'

namespace :import_data_csv do
  task :create_data => :environment do
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

