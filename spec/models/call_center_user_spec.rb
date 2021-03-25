# require 'rails_helper'
#
# RSpec.describe CallCenterUser, type: :model do
#   let!(:call_center_user) { create :call_center_user }
#
#   it "Userは有効である" do
#     expect(call_center_user).to be_valid
#   end
#
#   it "名前が空白の場合無効である" do
#     call_center_user.name = ""
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "名前がnilの場合無効である" do
#     call_center_user.name = nil
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "名前が31文字以上の場合無効である" do
#     call_center_user.name = "a" * 31
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "名前が29文字の場合有効である" do
#     call_center_user.name = "a" * 29
#     expect(call_center_user).to be_valid
#   end
#
#   it "メールアドレスが空白の場合無効である" do
#     call_center_user.email = ""
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "メールアドレスがnilの場合無効である" do
#     call_center_user.email = nil
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "メールアドレスが201文字以上の場合無効である" do
#     call_center_user.email = "a" * 200 + "@gmail.com"
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "メールアドレスが199文字の場合有効である" do
#     call_center_user.email = "a" * 188 + "@gmail.com"
#     expect(call_center_user).to be_valid
#   end
#
#   it "メールアドレスはユニークである" do
#     call_center_user2 = CallCenterUser.new(name: "test", email: "test@gmail.com")
#     expect(call_center_user2).not_to be_valid
#   end
#
#   it "パスワードが空白の場合無効である" do
#     call_center_user.password_confirmation = ""
#     expect(call_center_user).not_to be_valid
#   end
#
#   it "パスワードが5文字の場合無効である" do
#     call_center_user.password_confirmation = "a" * 5
#     expect(call_center_user).not_to be_valid
#   end
#
#   it 'パスワードとパスワード（確認）が異なる場合無効である' do
#     call_center_user.password_confirmation = 'a' * 6
#     expect(call_center_user).to be_invalid
#   end
#
#   it 'パスワード（確認）が空欄だと保存できないこと' do
#     call_center_user.password_confirmation = ''
#     expect(call_center_user).to be_invalid
#   end
# end
