class Course < ActiveRecord::Base
  def self.search(search)
    where("course_title ILIKE :p", p: "%#{search}%")
  end
end
