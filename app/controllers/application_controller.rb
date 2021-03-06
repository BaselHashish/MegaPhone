class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

def confirm_logged_in
  unless session[:user_id]
    flash[:error] = "Please log in."
    redirect_to(:controller => 'access', :action => 'login')
    return false # halts the before_action
  else
    return true
  end
end

def isAdmin
unless User.find(session[:user_id]).admin
  flash[:error] = "Only Admin Users can access this page!"
  redirect_to(:controller=>'access', :action =>'index')
  return false
else
  return true
end
end


end
