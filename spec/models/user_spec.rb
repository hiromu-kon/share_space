require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create :user }
  let(:another_user) { create :another_user }

  context 'User#create' do
    it "Userは有効である" do
      expect(user).to be_valid
    end

    it "名前が空白の場合無効である" do
      user.name = ""
      expect(user).not_to be_valid
    end

    it "名前がnilの場合無効である" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "名前が31文字以上の場合無効である" do
      user.name = "a" * 31
      expect(user).not_to be_valid
    end

    it "名前が29文字の場合有効である" do
      user.name = "a" * 29
      expect(user).to be_valid
    end

    it "メールアドレスが空白の場合無効である" do
      user.email = ""
      expect(user).not_to be_valid
    end

    it "メールアドレスがnilの場合無効である" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "メールアドレスが201文字以上の場合無効である" do
      user.email = "a" * 200 + "@gmail.com"
      expect(user).not_to be_valid
    end

    it "メールアドレスが199文字の場合有効である" do
      user.email = "a" * 188 + "@gmail.com"
      expect(user).to be_valid
    end

    it "メールアドレスはユニークである" do
      user2 = User.new(name: "test", email: "test@gmail.com")
      expect(user2).not_to be_valid
    end

    it "パスワードが空白の場合無効である" do
      user.password_confirmation = ""
      expect(user).not_to be_valid
    end

    it "パスワードが5文字の場合無効である" do
      user.password_confirmation = "a" * 5
      expect(user).not_to be_valid
    end

    it 'パスワードとパスワード（確認）が異なる場合無効である' do
      user.password_confirmation = 'a' * 6
      expect(user).to be_invalid
    end

    it 'パスワード（確認）が空欄だと保存できないこと' do
      user.password_confirmation = ''
      expect(user).to be_invalid
    end

    describe '一意性の検証' do
      it 'メールアドレスは大文字小文字を区別せず扱うこと' do
        user.password = 'sample@example.com'
        another_user.password = 'SAMPLE@EXAMPLE.COM'
        expect(another_user).to be_valid
      end
    end

    describe 'パスワードの検証' do
      it 'パスワードと確認用パスワードが間違っている場合、無効であること' do
        user.password = 'password'
        user.password_confirmation = 'pass'
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it 'パスワードが暗号化されていること' do
        expect(user.encrypted_password).to_not eq 'password'
      end
    end

    describe 'フォーマットの検証' do
      it 'メールアドレスが正常なフォーマットの場合、有効であること' do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                             first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end
  end
end
