json.user_name @comment.user.nickname
if @comment.user.image.present?
  json.image @comment.user.image.url
else
  json.image "/assets/no_image4-fa70395274d90d9bd8ede40175cb8b6e2c5ccc599d7dbf9a2836c5ed96e875d6.png"
end
json.created_at @comment.created_at.strftime("%H:%M")
json.text @comment.text
json.learning_time @comment.learning_time
