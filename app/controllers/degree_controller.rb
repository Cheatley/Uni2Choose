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
    @save_search = Search.create(:saved_search => request.fullpath, :users_id => current_user.id)
  end

end
