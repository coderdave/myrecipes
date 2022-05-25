class ChefMailer < ApplicationMailer

    def welcome_email
        @chef = params[:chef_id]
        @url  = 'http://example.com/login'
        mail(to: @chef.email, subject: 'Please Verify MyRecipes Account')
    end
end
