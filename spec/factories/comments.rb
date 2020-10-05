FactoryBot.define do
  factory :comment do
    text                  { "テスト" }
    learning_time         { 120 }
    user
  end
end
