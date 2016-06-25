class Search < ActiveRecord::Base

=begin
  def Course.search(keyword)
    where('cname LIKE ?', "%#{keyword}%")
  end

  def University.advanced_search(uregion)
    where('uregion LIKE ?', "%#{uregion}%")
    where('uname' LIKE ?, "%{uname}%")
  end

=end
end
