class UsersController < ApplicationController
  def new
    @users = User.new
  end
  
  def create
    hashed_password = BCrypt::Password.create(params[:user][:pass])
    @users = User.new(name: params[:user][:name],pass: hashed_password)
    @users.save
    flash[:success] ='新規登録完了'
    redirect_to root_path
  end
end
