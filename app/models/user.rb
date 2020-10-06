class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  mount_uploader :image, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :nickname, presence: true, length: { maximum: 20 },
                       uniqueness: true
  validates :introduction, length: { maximum: 75 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です' }
  validates :password, presence: true, length: { in: 7..128 }
  validates :password_confirmation, presence: true, length: { in: 7..128 }
end
