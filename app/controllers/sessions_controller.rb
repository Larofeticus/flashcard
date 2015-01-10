# sessions controller
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      flash[:success] = 'log in successful'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:warning] = 'sign in failed'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'sign out successful'
    redirect_to root_path
  end
end
