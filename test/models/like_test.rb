require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create!(chefname: "AtDev", email: "mashrur@example.com", password: "password", password_confirmation: "password")
    @recipe = Recipe.create!(name:"apples", description: "Any description", chef_id: @chef.id )
    @recipe_likes = Like.new(chef_id: @chef.id, recipe_id: @recipe.id)
  end

  test "should be valid" do
    assert @recipe_likes.valid?
  end

  test "recipes id should be present" do
    @recipe_likes.recipe_id = " "
    assert_not @recipe_likes.valid?
  end

  test "chef id should be present" do
    @recipe_likes.chef_id = " "
    assert_not @recipe_likes.valid?
  end

  test "like without chef should be invalid" do
    @recipe_likes.chef_id = nil
    assert_not @recipe_likes.valid?
  end

  test "like without recipe should be invalid" do
    @recipe_likes.recipe_id = nil
    assert_not @recipe_likes.valid?
  end
end
