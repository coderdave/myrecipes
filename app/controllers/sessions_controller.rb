class SessionsController < ApplicationController
  before_action :set_account_verified, only: [:new]

  def new
    byebug
  end
  
  def create
    chef = Chef.find_by(email: params[:session][:email].downcase)
    #[:emailVerified]
    logger.debug "Parameter : |#{params[:account_verified].downcase.strip}|"
    logger.debug "Chef email: |#{chef.email.downcase}|"
    byebug
    if chef && chef.authenticate(params[:session][:password]) && (params[:account_verified]).strip == chef.email
      # params[:account_verified].include?(chef.email)
      ## create a method for this action
      chef.account_verified = true
      chef.save!
      #chef.confirme_email_account
      ##
      session[:chef_id] = chef.id
      cookies.signed[:chef_id] = chef.id
      flash[:success] = "Account email verified and successfully logged in"
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
    @accountVerified = " "+params[:account_verified]+" "
  end
  
end