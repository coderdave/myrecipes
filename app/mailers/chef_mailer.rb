class ChefMailer < ApplicationMailer
  default from: 'no-reply <smyrecipes@gmail.com>'

  def welcome_email
    @chef = params[:chef]
    @url  = verify_url
    @url += "?account_verified=" + @chef.auth_token
    
    mail(
        to: @chef.email, 
        subject: 'Please Verify MyRecipes Account'
        )
  end

end
