class Degree < ActiveRecord::Base

  def self.search(search)
    where("cname LIKE :p", p: "%#{search}%")
  end
  
  def self.ransackable_attributes(auth_object = nil)
    %w( uname cname duration qualification ) + _ransackers.keys
  end
end
