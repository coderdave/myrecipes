class CreateRecipeLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_likes do |t|
      t.references :recipes, null: false, foreign_key: true
      t.references :chefs, null: false, foreign_key: true
      t.boolean :like

      t.timestamps
    end
  end
end
