class Similarity < ActiveRecord::Base
    validates :ucas_letter, presence: true
    validates :compared_ucas_letter, presence: true
    validates :similarity, presence: true
end
