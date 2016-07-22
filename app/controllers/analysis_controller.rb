class AnalysisController < ApplicationController
  
  def user_analysis
    @users = User.all
    @searches = Search.all
    @socialmedialogin = Identity.all
    @postcodes = User.all
  end
  

end
