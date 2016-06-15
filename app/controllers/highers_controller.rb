class CoursesController < ApplicationController
  def home

    subjectform = Highers.all.order(id: :asc)
    @subject = subjectform.higher 





  
  end
end