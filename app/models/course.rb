class Course < ActiveRecord::Base
  def self.search(search)
    where("course_title LIKE :p", p: "%#{search}%")
  end
  
  def self.advanced_search(interests)
    where('departments LIKE ? OR course_title LIKE ?', "%#{interests}%", "%#{interests}%")
  end

end
