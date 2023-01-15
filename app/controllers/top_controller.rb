class TopController < ApplicationController
  def main
    render 'main'
  end
  def login
    if @users = User.find_by(name: params[:name])
      login_password = BCrypt::Password.new(@users.pass)
      if login_password = params[:pass]
        session[:login_uid] = params[:name]
        flash.now[:session] = 'ログイン成功'
        render 'companies/index'
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