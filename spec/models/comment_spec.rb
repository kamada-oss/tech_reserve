require 'rails_helper'
describe Comment do
  describe '#create' do
    it 'text, learning_timeがあれば登録できること' do
      comment = build_stubbed(:comment)
      expect(comment).to be_valid
    end
    
    # text
    it 'textがない場合は登録できないこと' do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

    it 'textが75文字以下の場合は登録できること' do
      comment = build_stubbed(:comment, text: 'a'*75)
      expect(comment).to be_valid
    end

    it 'textが76文字以上の場合は登録できない' do
      comment = build_stubbed(:comment, text: 'a'*76)
      comment.valid?
      expect(comment.errors[:text]).to include("は75文字以内で入力してください")
    end

    # learning_time
    it 'learing_timeがない場合は登録できないこと' do
      comment = build(:comment, learning_time: nil)
      comment.valid?
      expect(comment.errors[:learning_time]).to include("を入力してください")
    end

    it 'learning_timeが数値以外の場合は登録できない' do
      comment = build(:comment, learning_time: 'aaaa')
      comment.valid?
      expect(comment.errors[:learning_time]).to include("は数値で入力してください")
    end
  end
end