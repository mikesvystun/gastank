class User < ApplicationRecord
has_many :cars

validates :name, presence: true, length: {maximum: 9}

end
