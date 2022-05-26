class Recipe < ApplicationRecord
  belongs_to :chef
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :chef_id, presence: true

  default_scope -> { order(updated_at: :desc)}
  has_many_attached :images, dependent: :destroy

  has_one_attached :photo
  validates :photo, presence: true
  validate :correct_format_image

  private 

  def correct_format_image
    if  photo.attached? && !photo.content_type.in?(%w(image/png image/jpeg image/jpg))
      errors.add(:photo, 'Must be an image file jpg, jpeg, png')
    end
  end
end