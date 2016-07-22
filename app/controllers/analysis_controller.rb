class AnalysisController < ApplicationController
  
  def user_analysis
    @users = User.all
    @searches = Search.all
    @registrations = User.all
    @socialmedialogin = Identity.all
  end
  

end
