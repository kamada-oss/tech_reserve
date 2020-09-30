class CreateCommentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_categories do |t|
      t.references :comment, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
