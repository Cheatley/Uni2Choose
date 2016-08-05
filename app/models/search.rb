class Search < ActiveRecord::Base
    validates :saved_search, presence: true
    validates :users_id, presence: true
    validates :uname, presence: true
    validates :cname, presence: true
end
