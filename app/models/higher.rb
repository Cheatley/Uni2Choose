class Higher < ActiveRecord::Base

def home
   subjectform = Higher.all.order(id: :asc)
    @subject = subjectform.higher 

end

=begin
  def self.search(selection)
    where("higher LIKE :p", p: "%#{selection}%")
  end
=end

end
