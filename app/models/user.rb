class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
       :omniauthable, omniauth_providers: [:facebook]
has_many :cars, dependent: :destroy
has_many :authentications, dependent: :destroy

validates :name, presence: true


  def self.from_omniauth(auth)
    @authentication = Authentication.from_omniauth(auth)
    unless @authentication.user.present?
      @authentication.user = User.where(email: auth.info.email).first_or_create do |user|
         user.name = auth.info.first_name
         user.password = Devise.friendly_token
         user.confirmed_at = Time.now
      end
      @authentication.save
    end
    return @authentication.user
  end


end
