class SessionsController < ApplicationController
  before_action :set_account_verified, only: [:new]

  def new
    
  end
  
  def create
    chef = Chef.find_by(email: params[:session][:email].downcase)
    if chef && chef.authenticate(params[:session][:password]) && (params[:account_verified]) == chef.email
      chef.account_verified = true
      chef.save!
      session[:chef_id] = chef.id
      cookies.signed[:chef_id] = chef.id
      flash[:success] = chef.name+", thank you for verifying your account"
      redirect_to chef
    elsif chef && chef.authenticate(params[:session][:password])
      session[:chef_id] = chef.id
      cookies.signed[:chef_id] = chef.id
      flash[:success] = "You have successfully logged in"
      redirect_to chef
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
  private
  
  def set_account_verified
    @account_verified = params[:account_verified]
  end
  
end