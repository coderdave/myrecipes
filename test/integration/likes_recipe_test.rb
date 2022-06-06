require "test_helper"

class LikesRecipe < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(name: "mashrur", email: "mashrur@example.com",
                         password: "password", password_confirmation: "password")
    @recipe = Recipe.create!(name: "vegetable saute", 
                            description: "great vegetable sautee, add vegetable and oil",
                            chef: @chef)
    
  end

  test "create a new like" do
    sign_in_as(@chef, "password")
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_difference 'Like.count', 1 do
      post recipe_likes_path(@recipe), xhr: true, params: { like: { recipe_id: @recipe.id, chef_id: @chef.id } }
    end
  end

  test "delete a like" do
    @like = Like.create!(recipe_id: @recipe.id, chef_id: @chef.id)
    sign_in_as(@chef, "password")
    get recipe_path(@recipe), xhr: true
    assert_template 'recipes/show'
    assert_select 'a[href=?]', recipe_like_path(recipe_id: @recipe.id, id: @like.id)
    assert_difference 'Like.count', -1 do
      delete recipe_like_path(recipe_id: @recipe.id, id: @like.id), xhr: true
    end
  end

end