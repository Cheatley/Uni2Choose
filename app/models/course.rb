class Course < ActiveRecord::Base
  
  def Course.search(search)
    where("cname LIKE :p", p: "%#{search}%")
  end
  
end
