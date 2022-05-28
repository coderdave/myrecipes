class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy #If I delete an Ingredient it deletes its associations with recipes
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end