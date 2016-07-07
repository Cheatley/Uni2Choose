class Degree < ActiveRecord::Base

<<<<<<< HEAD
  def self.search(search)
    where("cname LIKE :p", p: "%#{search}%")
=======
  def Degree.search(search)
    where("cname LIKE ? OR ucas LIKE ?", "%#{search}%", "%#{search}%")
>>>>>>> rant
  end
end
