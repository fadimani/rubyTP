class Utilisateur < ApplicationRecord

  has_many :articles, dependent: :destroy

  validates :nom, presence: true, length: { maximum: 50 }
  # @example.com
  # AAA@example.com
  VALID_EMAIL = /(\w*)@(\w*)\.(\w{2,4})/i

  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }

  validates :password, presence: true , length: {minimum:6}

  has_secure_password
end
