class Course < ActiveRecord::Base
  def self.search(search)
    where("course_title ILIKE :p", p: "%#{search}%")
  end
  
  def self.gradesearch(grades)
    where("highers ILIKE :p", p: "%#{grades}%")
  end
end
