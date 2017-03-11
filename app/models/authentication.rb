class Authentication < ApplicationRecord
  belongs_to :user

  validates :uid, :user_id, :provider, presence: true 
  validates_uniqueness_of :uid, scope: :provider


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize
  end


end

