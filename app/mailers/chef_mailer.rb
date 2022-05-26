class ChefMailer < ApplicationMailer
  default from: 'no-reply <smyrecipes@gmail.com>'
  
  def welcome_email
    @chef = params[:chef]
    @url  = "http://localhost:3000/login?emailVerified="+@chef.email
    mail(
        to: email_address_with_name(@chef.email, @chef.chefname), 
        subject: 'Please Verify MyRecipes Account'
        )
  end

end
