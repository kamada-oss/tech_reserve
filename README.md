# Tech_Reserve
[![Image from Gyazo](https://i.gyazo.com/4fda834a6ea356f25013d4d31cc2b11b.png)](https://gyazo.com/4fda834a6ea356f25013d4d31cc2b11b)


## 概要
このアプリでは、
日々のプログラミング学習をアウトプットすることで、
1. 誰かと学習した内容を共有したり、
2. 積み上げた学習を視覚的に楽しむことが出来ます。
  
## URL
https://techreserve.tk/
  
## 使用技術
- Ruby 2.5.1
- Ruby on Rails 5.2.4.4
- jQuery
- ajax
- AWS(EC2,RDS for MySQL,S3,VPC,Route53,ALB,ACM)
- Nginx,Unicorn
- Capistranoによる自動デプロイ
- RSpec
- Rubocop
  
## 機能
- ログイン ユーザー登録（devise）
- プロフィール画像投稿（aws-fog, carrierwave, mini_magick）
- アウトプット投稿 (ajax)
- アウトプットに対する「いいね！」（ajax）
- アウトプットに対する「フォロー」（ajax）
- アウトプットのカテゴライズ
- カレンダーとアウトプットを紐付けて表示（fullcalendar-rails, momentjs-rails）
- アウトプットをグラフ化（chartkick）

## インフラ構造図
[![Image from Gyazo](https://i.gyazo.com/a46fe8f51a402af4c4dfaa7eafb9f935.png)](https://gyazo.com/a46fe8f51a402af4c4dfaa7eafb9f935)

## ER図
[![Image from Gyazo](https://i.gyazo.com/4846661937688c7fa3b13a46bf5ecabd.png)](https://gyazo.com/4846661937688c7fa3b13a46bf5ecabd)
  
  
<!-- ↓過去のバックアップ -->
<!-- |Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|introduction|text|

### Association
- has_many :goods, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :events, dependent: :destroy

## comments テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|text|text|null: false|
|learning_time|integer|null: false|

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

## eventsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|body|string||
|start_date|datetime||
|end_date|datetime||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true, index: true|
|follow_id|references|foreign_key: true {to_table: :users}|

### Association
- belongs_to :user -->

<!-- ## ER図
<img width="1148" alt="ER図２" src="https://user-images.githubusercontent.com/64828177/88174033-8777f800-cc5e-11ea-9574-2ba429ef25a5.png"> -->
