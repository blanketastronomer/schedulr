class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    if !user_signed_in?
      redirect_to user_session_path
    end
  end
end
