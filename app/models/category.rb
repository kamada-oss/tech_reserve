class Category < ApplicationRecord
  has_many :comment_categories , dependent: :destroy
  has_many :comments, through: :comment_categories

  validates :name, presence:true, uniqueness: true

  enum name: {
    PHP:1, JavaScript:2, Python:3, GO:4, Kotlin:5, Java:6, Swift:7,
    C:8, 'C++':9, 'C♯':10, HTML:11, CSS:12, TypeScript:13, Rust:14, Ruby:15,
    Rails:16, Javascript:17, Unity:18, WordPress:19, ObjectiveC:20,
    SQL:21, React:22, AngularJS:23, Django: 24, Vuejs:25, Laravel:26,
    ASPNET: 27, VBA:28, VBNET:29, COBOL:30
  }
end
