require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(name: "mashrur", email: "mashrur@example.com",
                        password: "password", password_confirmation: "password")
    @photo_of_recipe = fixture_file_upload('test/fixtures/files/test.jpg', "image/jpg")
    @recipe = Recipe.create(
      name: "vegetable saute", 
      description: "great vegetable sautee, add vegetable and oil", 
      photo: @photo_of_recipe,
      chef: @chef)
    @recipe2 = @chef.recipes.build(
      name: "chicken saute", 
      description: "great chicken dish", 
      photo: @photo_of_recipe)
    @recipe2.save
  end
  
  test "should get chefs show" do
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
    assert_match @recipe.description, response.body
    assert_match @recipe2.description, response.body
    assert @recipe.photo.attached?, response.body
    assert_match @chef.name, response.body
  end
end
