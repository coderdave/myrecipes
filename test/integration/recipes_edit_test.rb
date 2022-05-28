require "test_helper"

class RecipesEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com",
      password: "password", password_confirmation: "password")
      @photo_of_recipe = fixture_file_upload('test/fixtures/files/test.jpg', "image/jpg")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", photo: @photo_of_recipe, chef: @chef)
  end

  test "reject invalid recipe update" do
    sign_in_as(@chef, "password")
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: { name: " ", description: "some description", photo: fixture_file_upload('test/fixtures/files/test.jpg', "image/jpg") } } 
    assert_template 'recipes/edit'
    assert_select 'div.bg-danger'
    assert_select 'div.card-body'
  end
  
  test "successfully edit a recipe" do
    sign_in_as(@chef, "password")
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    updated_name = "updated recipe name"
    updated_description = "updated recipe description"
    photo_of_recipe = fixture_file_upload('test/fixtures/files/test.jpg', "image/jpg")
    patch recipe_path(@recipe), params: { recipe: { name: updated_name, description: updated_description, photo: photo_of_recipe } }
    assert_redirected_to @recipe
    assert_not flash.empty?
    @recipe.reload
    assert_match updated_name, @recipe.name
    assert_match updated_description, @recipe.description
  end
end
