class Recommend < ActiveRecord::Base
    
    def f
    @topics = Reccomend.find(params[:topic])

    end
  
end
