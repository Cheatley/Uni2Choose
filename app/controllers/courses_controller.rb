class CoursesController < ApplicationController
  def index
    @degrees = Course.all
  end
  
  def search
    @search = Course.all.select(:course_title, :ucas_code, :highers, :degree_type).distinct.order(id: :ASC)
    if params[:search]
      @search_course = Course.search(params[:search]).order('ucas_code ASC')
    end
  end
end
