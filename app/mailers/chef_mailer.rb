class ChefMailer < ApplicationMailer
  default from: 'no-reply <smyrecipes@gmail.com>'
  
  def welcome_email
    @chef = params[:chef]
    @url  = ENV['URL_AUTH']
    @url  += "verify?account_verified=" + @chef.auth_token
    
    mail(
        to: @chef.email, 
        subject: 'Please Verify MyRecipes Account'
        )
  end

end
