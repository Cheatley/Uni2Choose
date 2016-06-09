class Course < ActiveRecord::Base
  def self.search(search)
    where("course_title ILIKE :p", p: "%#{search}%")
  end
  
  def self.advanced_search(interests)
    where('departments ILIKE ? OR course_title ILIKE ?', "%#{interests}%", "%#{interests}%")
  end

end
