require "test_helper"

class LikesRecipe < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(name: "mashrur", email: "mashrur@example.com",
                         password: "password", password_confirmation: "password")
    @recipe = Recipe.create!(name: "vegetable saute", 
                            description: "great vegetable sautee, add vegetable and oil",
                            chef: @chef)
    @like = Like.create!(recipe_id: @recipe.id, chef_id: @chef.id)
  end

  test "create a new like"
    sign_in_as(@chef, "password")
    get recipes_path
    assert_template 'recipes/index'
    assert_difference 'Like.count', 1 do
      post recipe_likes_path(@recipe), params: { like: { recipe_id: @recipe.id, chef_id: @chef.id } }
    end
  end

  test "delete a like"
    sign_in_as(@chef, "password")
    get recipe_path
    assert_template 'recipe/index'
    if @like.chef_id == @chef.id && @like.recipe_id == @recipe.id
      assert_select 'a[href=?]', recipe_like_path(recipe_id: @recipe.id, id: @like.id)
      assert_difference 'Like.count', -1 do
        delete recipe_like_path(recipe_id: @recipe.id, id: @like.id)
      end
    end
  end
end