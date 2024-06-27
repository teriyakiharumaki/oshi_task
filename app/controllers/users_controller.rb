# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user.email, params[:user][:password])
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
    @oshi_profile = current_user.oshi_profile
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
