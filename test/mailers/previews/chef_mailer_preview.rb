# Preview all emails at http://localhost:3000/rails/mailers/chef_mailer
class ChefMailerPreview < ActionMailer::Preview
    def welcome_email
      ChefMailer.with(chef: Chef.last).welcome_email
    end
end
