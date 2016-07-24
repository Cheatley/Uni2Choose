class AnalysisController < ApplicationController

  #User Analysis graphs with the Chartkick gem on the admin profile
  def user_analysis
    @users = User.all
    @searches = Search.all
    @socialmedialogin = Identity.all
    @postcodes = User.all
  end
  

end
