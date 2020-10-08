class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_many :goods
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :nickname, presence: true, length: { maximum: 20 },
                       uniqueness: true
  validates :introduction, length: { maximum: 75 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です' }
  validates :password, presence: true, length: { in: 7..128 }
  validates :password_confirmation, presence: true, length: { in: 7..128 }

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
