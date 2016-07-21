class DegreeController < ApplicationController
  def index
    @degreecourses = Degree.all
  end

  def keyword_search
    @search = Degree.all.select(:uname, :cname, :ucas, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @search_degree = Degree.search(params[:search]).order('cname ASC')
    end
  end

  def coursepage
    @a = params[:indcoursepage]
    @coursepage = Degree.all.where(id: @a).first
    if Search.exists?(:saved_search => request.fullpath, :users_id => current_user.id)
    else
      flash.now[:notice] = "Degree succesfully saved to your profile."
      #http://stackoverflow.com/questions/14531426/how-can-i-save-ransack-searches-to-the-database
      @save_search = Search.create(:saved_search => request.fullpath, :users_id => current_user.id)
    end
  end
  
  def computer
    @select = Degree.all.select(:cname).distinct.order(id: :ASC)
    if params[:select]
    @select_degree = Degree.search.(params[:cname])
    @search = Degree.all.select(:cname)
  end
  
  end
  
end