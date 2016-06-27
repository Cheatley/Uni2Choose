
require 'csv'

#importing the CSV file into the Degree table 
namespace :import_rsystem_csv do
  task :rsystem_data => :environment do
    csv_text = File.read("rsystem.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Recommend.create!(row.to_hash)
    end
  end
end 

#importing the CSV file into the Degree table 
namespace :import_suc_csv do
  task :suc_data => :environment do
    csv_text = File.read("suc.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Degree.create!(row.to_hash)
    end
  end
end 
#importing the CSV 
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

namespace :import_similarities_csv do
  task :similarities_data => :environment do
    csv_text = File.read("similarities.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Similarity.create!(row.to_hash)
    end
  end
end 
