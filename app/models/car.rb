class Car < ApplicationRecord
belongs_to :user
has_many :refills

validates :name, presence: true
validates :total_probig, length: {maximum: 12} 
validates :total_vartist, length: {maximum: 12}
validates :total_liters, length: {maximum: 12}


end
