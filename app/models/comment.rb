class Comment < ApplicationRecord
  belongs_to :user
  has_many :comment_categories , dependent: :destroy
  has_many :categories, through: :comment_categories

  validates :text, presence:true
  validates :learning_time, presence:true
  validates :user_id, presence:true
end
