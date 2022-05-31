class Chef < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
   
  before_save { self.email = email.downcase }
  before_create :set_auth_token
  
  has_secure_password
  has_secure_token :auth_token

  private

  def set_auth_token
    self.auth_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless Chef.where(auth_token: token).exists?
    end
  end
  
end