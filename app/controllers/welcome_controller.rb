class WelcomeController < ApplicationController
  before_action :redirect_signed_in_users, only: [:index]

  def index; end

  def redirect_signed_in_users
    redirect_to home_path if user_signed_in?
  end
end
