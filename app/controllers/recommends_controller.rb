class RecommendsController < ApplicationController
  def new
  end
  
     def f
    @topics = Reccomend.find(params[:topic])

  end
end
