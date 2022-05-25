class ChefMailer < ApplicationMailer
  default from: 'support@myrecipes.com'
  
  def welcome_email
    @chef = params[:chef_id]
    @url  = 'http://localhost/login'
    mail(
        to: email_address_with_name(@chef.email, @chef.chefname), 
        subject: 'Please Verify MyRecipes Account'
        )
  end

end
