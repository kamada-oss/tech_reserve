class User < ApplicationRecord
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
end
