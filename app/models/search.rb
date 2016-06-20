class Search < ActiveRecord::Base
  
  def Course.new(keyword)
    where('course_title NOT LIKE ?', "%#{keyword}%")
  end
  
end
