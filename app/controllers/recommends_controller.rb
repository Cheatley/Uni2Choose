class RecommendsController < ApplicationController
  def new
  end
  
     def f
    @types = Reccomend.select(:topic).distinct

  end
end
