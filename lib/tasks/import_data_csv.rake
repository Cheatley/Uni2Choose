
require 'csv'

#importing the CSV file into the Degree table 
namespace :rsystem do
  task :data => :environment do
    csv_text = File.read("rsystem.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Recommend.create!(row.to_hash)
    end
  end
end 

#importing the CSV file into the Degree table 
namespace :suc do
  task :data => :environment do
    csv_text = File.read("suc.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Degree.create!(row.to_hash)
    end
  end
end 
#importing the CSV 
namespace :highers do
  task :data => :environment do
    csv_text = File.read("highers.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Higher.create!(row.to_hash)
    end
  end
end 

namespace :scotlandunis do
  task :data => :environment do
    csv_text = File.read("scotlandunis.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      University.create!(row.to_hash)
    end
  end
end 

namespace :ucasletters do
  task :data => :environment do
    csv_text = File.read("ucasletters.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Ucasletter.create!(row.to_hash)
    end
  end
end 

namespace :similarities do
  task :data => :environment do
    csv_text = File.read("similarities.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Similarity.create!(row.to_hash)
    end
  end
end 
