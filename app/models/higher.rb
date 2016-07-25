class Higher < ActiveRecord::Base
  
  #used?
  def home
    subjectform = Higher.all.order(id: :asc)
    @subject = subjectform.higher 
  end
end
