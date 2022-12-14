class TopController < ApplicationController
  def main
    render 'main'
  end
  def login
      users = User.find_by(name: params[:name])
      if users
        login_password = BCrypt::Password.new(users.pass)
        if login_password == params[:pass]
          session[:login_uid] = params[:name]
          flash.now[:session] = 'ログイン成功'
          render 'main'
        else
          render 'login'
        end
      end
  end
  
  def logout
    session.delete(:login_uid)
    flash.now[:logout] = 'ログアウト成功'
    render 'main'
  end
end
