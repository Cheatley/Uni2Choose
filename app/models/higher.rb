class Higher < ActiveRecord::Base

def home
   subjectform = Higher.all.order(id: :asc)
    @subject = subjectform.higher 

end


end
