class Chef < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :recipes, through: :likes

  validates :chefname, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true

  before_save { self.email = email.downcase }

  has_secure_password
end
