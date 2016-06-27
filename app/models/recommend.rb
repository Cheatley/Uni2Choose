class Recommend < ActiveRecord::Base
    
    def actionname
    @types = Reccomend.select(:topics).distinct

  end
  
end
