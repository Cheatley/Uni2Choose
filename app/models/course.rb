class Course < ActiveRecord::Base
  
  def self.search(search)
    where("cname ILIKE :p", p: "%#{search}%")
  end
  
end
