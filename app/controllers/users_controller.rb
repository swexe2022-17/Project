class UsersController < ApplicationController
  def new
    @users = User.new
  end
  
  def create
    @users = User.new(name: params[:user][:name],pass: params[:user][:pass])
    @users.save
    flash[:success] ='新規登録完了'
    redirect_to root_path
  end
end
