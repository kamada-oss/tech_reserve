class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname, presence: true, length: {maximum: 20},
            uniqueness: true
  validates :email, presence:true, uniqueness: true, 
            format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です'}
end
