class AccessController < ApplicationController

layout "application"
before_action :confirm_logged_in , :except => [:login, :attempt_login, :logout]

  def index
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
      if authorized_user
  # mark user as logged in
  session[:user_id] = authorized_user.id
  session[:username] = authorized_user.username
  session[:lat] = params[:lat]
  session[:lon] = params[:lon]
  flash[:notice] = "You are now logged in."
  redirect_to(:controller => 'tweets',:action => 'show')
      else
  flash[:error] = "Invalid username/password combination."
  redirect_to(:action => 'login')
      end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

end
