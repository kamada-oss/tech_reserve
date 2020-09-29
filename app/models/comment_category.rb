class CommentCategory < ApplicationRecord
  belongs_to :comment, optional: true
  belongs_to :category
  validates :category_id, presence:true
end
