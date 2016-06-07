class Course < ActiveRecord::Base
  def self.search(search)
    where("course_title LIKE :p", p: "%#{search}%")
  end
end
