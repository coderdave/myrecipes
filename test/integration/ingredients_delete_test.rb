require 'test_helper'

class IngredientsDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = Chef.create!(name:"Admin",email:"Admin@gmail.com",password:"password",password_confirmation:"password",admin:true) 
    @recipe = Recipe.create!(name:"Tacos de cochinita",description:"Long and usefull description", chef: @admin)
    @ingredient = Ingredient.create!(name:"Pork meat")
    @ingredient_2= Ingredient.create!(name:"Tortillas")
    @recipe.ingredients << @ingredient
    @recipe.ingredients << @ingredient_2
  end
  
  test "successfully delete an ingredient" do
    sign_in_as(@admin, "password")
    get edit_ingredient_path(@ingredient)
    assert_template 'ingredients/edit'
    assert_select 'a[href=?]', ingredient_path(@ingredient), text: "Delete Ingredient"
    assert_difference 'Ingredient.count', -1 do
      delete ingredient_path(@ingredient)
    end
    assert_redirected_to ingredients_path
    assert_not flash.empty?
  end

  test "Succesfully delete the association between recipe and ingredient after deleting a recipe" do
    sign_in_as(@admin, "password")
    delete recipe_path(@recipe)
    assert RecipeIngredient.where(recipe_id: @recipe).count == 0
  end
  
end
