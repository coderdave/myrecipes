require 'test_helper'

class IngredientsDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = Chef.create!(name:"Admin",email:"Admin@gmail.com",password:"password",password_confirmation:"password",admin:true) 
    @recipe = Recipe.create!(name:"Tacos de cochinita",description:"Long and usefull description", chef: @admin)
    @ingredient = Ingredient.create!(name:"Pork meat")
    @recipe.ingredients << @ingredient
  end
  
  test "successfully delete an ingredient" do
    sign_in_as(@admin, "password")
    get edit_ingredient_path(@ingredient)
    assert_template 'ingredients/edit'
    assert_select 'a[href=?]', ingredient_path(@ingredient), text: "Delete ingredient"
    assert_difference 'Ingredient.count', -1 do
      delete ingredient_path(@ingredient)
    end
    assert_redirected_to ingredients_path
    assert_not flash.empty?
  end
  
end
