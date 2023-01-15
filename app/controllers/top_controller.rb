class TopController < ApplicationController
  def main
    render 'main'
  end
  def login
<<<<<<< HEAD
    if @users = User.find_by(name: params[:name])
      login_password = BCrypt::Password.new(@users.pass)
      if login_password = params[:pass]
        session[:login_uid] = params[:name]
        flash.now[:session] = 'ログイン成功'
        render 'companies/index'
=======
      users = User.find_by(name: params[:name])
      if users
        login_password = BCrypt::Password.new(users.pass)
        if login_password = params[:pass]
          session[:login_uid] = params[:name]
          flash.now[:session] = 'ログイン成功'
          redirect_to companies_path
        else
          render 'login'
        end
>>>>>>> Y2
      end
    else
      render 'login'
    end
  end
  
  def logout
    session.delete(:login_uid)
    flash.now[:logout] = 'ログアウト成功'
    render 'main'
  end
end