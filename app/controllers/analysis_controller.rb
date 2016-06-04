class AnalysisController < ApplicationController

  def user_analysis
    @data = User.all
  end
  

end
