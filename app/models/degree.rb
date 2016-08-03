class Degree < ActiveRecord::Base
  
  def Degree.search(search)
    where("uname LIKE :p", p: "%#{search}%")
  end
  
  #Ransack search attributes accepted, fields uname and cname searchable, add others if needed
  #table: Degree
  def self.ransackable_attributes(auth_object = nil)
    %w( uname cname ) + _ransackers.keys
  end
end
