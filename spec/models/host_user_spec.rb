require 'rails_helper'

RSpec.describe HostUser, type: :model do
  let!(:host_user) { create :host_user }

  it "Userは有効である" do
    expect(host_user).to be_valid
  end

  it "名前が空白の場合無効である" do
    host_user.name = ""
    expect(host_user).not_to be_valid
  end

  it "名前がnilの場合無効である" do
    host_user.name = nil
    expect(host_user).not_to be_valid
  end

  it "名前が31文字以上の場合無効である" do
    host_user.name = "a" * 31
    expect(host_user).not_to be_valid
  end

  it "名前が29文字の場合有効である" do
    host_user.name = "a" * 29
    expect(host_user).to be_valid
  end

  it "メールアドレスが空白の場合無効である" do
    host_user.email = ""
    expect(host_user).not_to be_valid
  end

  it "メールアドレスがnilの場合無効である" do
    host_user.email = nil
    expect(host_user).not_to be_valid
  end

  it "メールアドレスが201文字以上の場合無効である" do
    host_user.email = "a" * 200 + "@gmail.com"
    expect(host_user).not_to be_valid
  end

  it "メールアドレスが199文字の場合有効である" do
    host_user.email = "a" * 188 + "@gmail.com"
    expect(host_user).to be_valid
  end

  it "メールアドレスはユニークである" do
    host_user2 = HostUser.new(name: "test", email: "test@gmail.com")
    expect(host_user2).not_to be_valid
  end

  it "パスワードが空白の場合無効である" do
    host_user.password_confirmation = ""
    expect(host_user).not_to be_valid
  end

  it "パスワードが5文字の場合無効である" do
    host_user.password_confirmation = "a" * 5
    expect(host_user).not_to be_valid
  end

  it 'パスワードとパスワード（確認）が異なる場合無効である' do
    host_user.password_confirmation = 'a' * 6
    expect(host_user).to be_invalid
  end

  it 'パスワード（確認）が空欄だと保存できないこと' do
    host_user.password_confirmation = ''
    expect(host_user).to be_invalid
  end
end
