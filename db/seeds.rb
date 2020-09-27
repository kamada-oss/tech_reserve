# 全カテゴリのデータを作成
Category.names.each do |key, value|
  Category.create(name:value)
end