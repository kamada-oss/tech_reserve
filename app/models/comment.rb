class Comment < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :comment_categories
end
