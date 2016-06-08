class Course < ActiveRecord::Base
  def self.search(search)
    where("course_title ILIKE :p", p: "%#{search}%")
  end
  
  def self.gradesearch(grades)
    where("highers LIKE :p", p: "%#{grades}%")
  end
end
