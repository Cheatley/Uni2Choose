class Degree < ActiveRecord::Base

  def self.search(search)
    where("cname LIKE :p", p: "%#{search}%")
  end
end
