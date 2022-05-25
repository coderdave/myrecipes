# Preview all emails at http://localhost:3000/rails/mailers/chef_mailer
class ChefMailerPreview < ActionMailer::Preview
    def welcome_email
      ChefMailer.with(chef_id: @chef).welcome_email
    end
end
