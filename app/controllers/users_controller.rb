class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def logout
    @current_user = User.find(current_user.id)
  end


end
