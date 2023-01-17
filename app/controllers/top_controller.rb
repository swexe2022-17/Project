class TopController < ApplicationController
  def main
    render 'main'
  end
  def login
    users = User.find_by(name: params[:name])
    if users
      login_password = BCrypt::Password.new(users.pass)
      if login_password = params[:pass]
        session[:login_uid] = params[:name]
        redirect_to companies_path
      else
        render 'login'
      end
    end
  end
 
  def logout
    session.delete(:login_uid)
    render 'main'
  end
end
