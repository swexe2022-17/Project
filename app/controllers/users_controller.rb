class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    hashed_password = BCrypt::Password.create(params[:user][:password])
    @user = User.new(name: params[:user][:name],password: hashed_password, password_confirmation: params[:user][:password_confirmation])
    if @user.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
