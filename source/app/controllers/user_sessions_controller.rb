class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    
    authorize! :create, @user_session
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    
    authorize! :create, @user_session
    
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def destroy
    authorize! :destroy, current_user_session
    
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_url
  end
end
