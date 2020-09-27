class Comment < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :comment_categories

  validates :name, presence:true, uniqueness: true
end
