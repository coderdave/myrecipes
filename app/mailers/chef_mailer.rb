class ChefMailer < ApplicationMailer
  default from: 'no-reply <smyrecipes@gmail.com>'
  before_action :chef_params, only: [:welcome_email, :reminder_email]

  def welcome_email
    mail(
        to: @chef.email, 
        subject: 'Please Verify MyRecipes Account'
        )
  end

  def reminder_email
    mail(
        to: @chef.email, 
        subject: 'MyRecipes Account Verification Reminder'
        )
  end

  private

  def chef_params
    @chef = params[:chef]
    @url  = verify_url
    @url += "?account_verified=" + @chef.auth_token
  end

end
