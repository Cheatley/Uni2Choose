class Degree < ActiveRecord::Base
    
    def Degree.search(search)
    where("cname LIKE :p", p: "%#{search}%")
  end
end
