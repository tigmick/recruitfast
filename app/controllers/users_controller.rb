class UsersController < ApplicationController
  def dashboard
    if current_user.client?
      @user = current_user
    else
      @user = current_user
    end
  end
end
