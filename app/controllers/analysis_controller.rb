class AnalysisController < ApplicationController
  add_crumb "Home", '/'
  
  def user_analysis
    add_crumb "User Analysis", analysis_path, links: false
    @data = User.all
  end
  

end
