## 機能
- コメント機能
- いいね機能
- マイページ機能
- ログイン機能


# DBテーブル構成

 ## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|introduction|text|

### Association
- has_many :goods, dependent: :destroy
- has_many :comments, dependent: :destroy

## comments テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|text|text|null: false|
|learning_time|time|null: false|

### Association
- belongs_to :user
- has_many :categories, through: :comment_categories

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false, unique: true|

### Association
- has_many :comments, through: :comment_categories

## comment_categories-テーブル

|Column|Type|Options|
|------|----|-------|
|comment_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :comment
- belongs_to :category


## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|comment_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## ER図
<img width="1148" alt="ER図２" src="https://user-images.githubusercontent.com/64828177/88174033-8777f800-cc5e-11ea-9574-2ba429ef25a5.png">
