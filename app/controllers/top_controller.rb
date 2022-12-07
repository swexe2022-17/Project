class TopController < ApplicationController
  def main
    render 'main'
  end
  def login
      if user = User.find_by(name: params[:name])
        session[:login_uid] = params[:name]
        flash.now[:session] = 'ログイン成功'
        render 'main'
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
