class HomeController < ApplicationController
  def index
   redirect_to cars_path if current_user.present?
  end
end
