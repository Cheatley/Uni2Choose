class Higher < ActiveRecord::Base
  
    validates :higher, presence: true
    validates :code_letter, presence: true


end
