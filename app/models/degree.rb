class Degree < ActiveRecord::Base

    def Degree.search(search)
    where("cname ILIKE :p", p: "%#{search}%")
  end
end
