class UsersController < ApplicationController


layout "application"


  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully."
      redirect_to(:controller => 'access', :action => 'login') and return
    else
      render ('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated Successfully"
      redirect_to(:controller => 'tweets',:action => 'show')
    else
      render('edit')
    end
  end

  def delete
  end



private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :description, :country)
end

end
