class RecipeLike < ApplicationRecord
  validates :chefs_id, presence: true
  validates :recipes_id, presence: true

  belongs_to :recipe
  belongs_to :chef
end
