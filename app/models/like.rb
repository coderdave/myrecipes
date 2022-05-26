class Like < ApplicationRecord

  validates :chef_id, presence: true
  validates :recipe_id, presence: true

  belongs_to :chef
  belongs_to :recipe

end
