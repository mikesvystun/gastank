class Refill < ApplicationRecord
belongs_to :car

validates :liters, presence: true, numericality: true, length: {maximum: 12}
validates :vartist, presence: true, numericality: true, length: {maximum: 12}
validates :probig, presence: true, numericality: true, length: {maximum: 12}

end
