class CommentCategory < ApplicationRecord
  belongs_to :comment
  belongs_to :category
  validates :category_id, presence:true
  validates :comment_id, presence:true
end
