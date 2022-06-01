require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = Ingredient.new(name: 'Tomato')
    Ingredient.create([{name: 'Pepper'}, {name: 'Salt'}, {name: 'Flour'}, {name: 'Corn'}, {name: 'Meat'}, {name: 'Chicken'}])
  end

  test "Ingredient should be not valid" do
    @ingredient.name = " "
    assert_not @ingredient.valid?
  end

  test "Ingredient should be valid" do
    assert @ingredient.valid?
  end

  test "Name duplicated should be not valid" do
    duplicated_ingredient = @ingredient.dup
    duplicated_ingredient.name = @ingredient.name
    @ingredient.save
    assert_not duplicated_ingredient.valid?
  end

  test "Valid scope menu items" do
    assert Ingredient.menu_items.size.eql?(5)
    last_item = Ingredient.order(created_at: :desc).limit(5).last
    assert Ingredient.menu_items.last.name.eql?(last_item.name)
  end
end