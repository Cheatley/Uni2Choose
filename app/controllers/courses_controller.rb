class CoursesController < ApplicationController
  def index
    @degrees = Course.all
  end
end
