class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname,null: false
      t.string :email,null: false, unique: true
      t.string :password,null: false
      t.text :introduction

      t.timestamps
    end
  end
end
