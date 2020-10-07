json.user_name @comment.user.nickname
if @comment.user.image.present?
  json.image @comment.user.image.url
else
  json.image User.first.image.url
end
json.created_at @comment.created_at.strftime("%H:%M")
json.text @comment.text
json.learning_time @comment.learning_time
