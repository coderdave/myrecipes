class ChefMailer < ApplicationMailer
  default from: 'no-reply <smyrecipes@gmail.com>'
  
  def welcome_email
    @chef = params[:chef]
    @url  = "http://localhost:3000/login?account_verified="+@chef.email
    mail(
        to: @chef.email, 
        subject: 'Please Verify MyRecipes Account'
        )
  end

end
