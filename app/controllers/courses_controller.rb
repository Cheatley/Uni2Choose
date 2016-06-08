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
  
  def searchbygrades
    @higher2_array = ["AABB", "ABBB"]
    @higher3_array = ["AAAB", "AABB", "ABBB"]
    @higher4_array = ["AAAB", "AABB", "ABBB", "AAAA", "AAAAB"]
    if params[:grades]
      choice = params[:grades]
      if choice == "1"
        @data = Course.all.where(highers: "ABBB")
      elsif choice == "2"
        @data = Course.all.where(highers: @higher2_array)
      elsif choice == "3"
        @data = Course.all.where(highers: @higher3_array)
      elsif choice == "4"
        @data = Course.all.where(highers: @higher4_array)
      end
    end
  end


end
