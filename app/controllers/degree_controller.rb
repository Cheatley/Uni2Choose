class DegreeController < ApplicationController
  
  #individual degree pages
  def coursepage
    #breadcrumbs
    add_crumb "Home", '/'
    add_crumb "Detailed Search", adsearch_path
    add_crumb "Degree Page", coursepage_path, links: false
    
    @a = params[:indcoursepage]
    @coursepage = Degree.all.where(id: @a).first
    
    #save the search result (individual degree page) to the current user's personal profile if it doesn't already exist
    if Search.exists?(:saved_search => request.fullpath, :users_id => current_user.id)
    else
      flash.now[:notice] = "Degree succesfully saved to your profile."
      #http://stackoverflow.com/questions/14531426/how-can-i-save-ransack-searches-to-the-database
      @save_search = Search.create(:saved_search => request.fullpath, :users_id => current_user.id, :cname => @coursepage.cname, :uname => @coursepage.uname)
    end
  end
end