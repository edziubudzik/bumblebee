class UsersController < ApplicationController
  def new
    @user = User.new
    
    authorize! :create, @user
  end

  def create
    @user = User.new(params[:user])
    
    authorize! :create, @user
    
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @user = current_user
    
    authorize! :read, @user
  end

  def edit
    @user = current_user
    
    authorize! :edit, @user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    
    authorize! :edit, @user
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
