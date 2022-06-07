class Like < ApplicationRecord

  validates :chef_id, presence: true
  validates :recipe_id, presence: true
  validates_uniqueness_of :chef, scope: :recipe

  belongs_to :chef
  belongs_to :recipe


end
