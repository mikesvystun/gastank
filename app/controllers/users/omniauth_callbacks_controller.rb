class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def provider
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user, event: :authenticantion
  end

  alias_method :facebook, :provider
  
end
