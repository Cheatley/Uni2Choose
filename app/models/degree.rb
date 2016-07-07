class Degree < ActiveRecord::Base

  def Degree.search(search)
    where("cname LIKE ? OR ucas LIKE ?", "%#{search}%", "%#{search}%")
  end
end
