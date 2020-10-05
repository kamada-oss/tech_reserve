# 全カテゴリのデータを作成
Category.names.each do |_key, value|
  Category.create(name: value)
end
