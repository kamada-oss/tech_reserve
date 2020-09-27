class ChangeDataLeaningTimeToComment < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :learning_time, :integer
  end
end
