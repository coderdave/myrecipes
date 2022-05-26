# Preview all emails at http://localhost:3000/rails/mailers/chef_mailer
class ChefMailerPreview < ActionMailer::Preview
    def welcome_email
      #chef = current_chef
      #@url  = 'http://localhost/login'
      #byebug
      ChefMailer.with(chef: Chef.last).welcome_email
    end
end
