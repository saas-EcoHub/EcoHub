class User < ApplicationRecord
  acts_as_voter
  has_many :promotions, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
