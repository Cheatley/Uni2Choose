class CoursesController < ApplicationController
  def index
    @degrees = Course.all
  end

  def keyword_search
    @search = Course.all.select(:uname, :cname, :duration, :qualification, :entry).distinct.order(id: :ASC)
    if params[:search]
      @search_course = Course.search(params[:search]).order('cname ASC')
    end
  end


=begin

##Commented out because the advanced search has been changed now to solely asking for the location of the desired course.##

  def advanced_search
    @advancedsearch = Course.all.select(:departments, :course_title, :ucas_code, :highers, :degree_type)
    
    @higher2_array = ["AABB", "ABBB"]
    @higher3_array = ["AAAB", "AABB", "ABBB"]
    @higher4_array = ["AAAB", "AABB", "ABBB", "AAAA", "AAAAB"]
    
    if params[:grades] == nil
      @choice = "1"
      @interests = "business"
    end
    
    if params[:grades]
      @choice = params[:grades]
      if @choice == "0"
        grades = Course.all.where(highers: "BBBB")
      elsif @choice == "1"
        grades = Course.all.where(highers: "ABBB")
      elsif @choice == "2"
        grades = Course.all.where(highers: @higher2_array)
      elsif @choice == "3"
        grades = Course.all.where(highers: @higher3_array)
      elsif @choice == "4"
        grades = Course.all.where(highers: @higher4_array)
      end
    end

    if params[:interests]
      interests = Course.advanced_search(params[:interests]).order('course_title ASC')
      @interests = params[:interests]
    end
    
    if params[:grades]
      @data = grades.merge(interests)
    end
  end
=end

end
