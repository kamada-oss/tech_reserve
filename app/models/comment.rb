class Comment < ApplicationRecord
  belongs_to :user
  has_many :comment_categories , dependent: :destroy
  has_many :categories, through: :comment_categories

  validates :text, presence:true, length: { maximum: 75 }
  validates :learning_time, presence:true, numericality: true
  validates :user_id, presence:true
end
