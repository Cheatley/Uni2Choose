class Course < ActiveRecord::Base

  
  def self.advanced_search(interests)
    where('departments LIKE ? OR course_title LIKE ?', "%#{interests}%", "%#{interests}%")
  end

end