require "test_helper"

class ChefMailerTest < ActionMailer::TestCase

  def setup
    @chef = Chef.create!(name: "mashrur", email: "mashrur@example.com", password: "password")
  end

  test "welcome email created for new chef" do
    mail = ChefMailer.with(chef: @chef).welcome_email
    assert_equal "Please Verify MyRecipes Account", mail.subject
    assert_equal [@chef.email], mail.to
    assert_equal ["smyrecipes@gmail.com"], mail.from
    assert_match "Welcome "+@chef.name+" to MyRecipes the best recipe sharing app ever!", mail.body.encoded
    assert_match @chef.auth_token, mail.body.encoded
  end

end
