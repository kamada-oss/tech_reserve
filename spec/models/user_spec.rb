require 'rails_helper'
describe User do
  describe '#create' do
    it 'nickname, email, password, password_confirmationがあれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    # nickname
    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it 'nicknameが20文字以下の場合は登録できること' do
      user = build(:user, nickname: 'a'*20)
      user.valid?
      expect(user).to be_valid
    end

    it 'nicknameが21文字以上の場合は登録できないこと' do
      user = build(:user, nickname: 'a'*21)
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it '重複したnicknameが存在する場合は登録できないこと' do
      user = create(:user)
      another_user = build(:user, nickname: 'abe')
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end

    # email
    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it '重複したemailが存在する場合は登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: 'kkk@gmail.com')
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it 'emailのフォーマットが不適切な場合は登録できないこと' do
      user = build(:user, email: 'aaa@aaa')
      user.valid?
      expect(user.errors[:email]).to include("のフォーマットが不適切です")
    end

    # password
    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it 'passwordが6文字以下の場合は登録できないこと' do
      user = build(:user, password: 'a'*6)
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it 'passwordが129文字以上の場合は登録できないこと' do
      user = build(:user, password: 'a'*129)
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end

    # password_confirmation
    it 'password_confirmationがない場合は登録できないこと' do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it 'password_confirmationが6文字以下の場合は登録できないこと' do
      user = build(:user, password_confirmation: 'a'*6)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("は7文字以上で入力してください")
    end

    it 'password_confirmationが129文字以上の場合は登録できないこと' do
      user = build(:user, password_confirmation: 'a'*129)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("は128文字以内で入力してください")
    end
  end
end