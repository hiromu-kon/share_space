# require 'rails_helper'
#
# RSpec.describe "CallCenterUsers", type: :system do
#   let(:call_center_user) { create :call_center_user }
#
#   describe "ユーザー新規登録ページ" do
#     before do
#       visit new_call_center_user_registration_path
#     end
#
#     it "ロゴをクリックするとHomeへ遷移" do
#       find(".logo").click
#       expect(current_path).to eq root_path
#     end
#
#     it "ログインのリンクを押すとログインページに遷移すること" do
#       click_on "すでにアカウントをお持ちの方はログイン"
#       expect(current_path).to eq new_call_center_user_session_path
#     end
#
#     context "ユーザー新規登録処理" do
#       it "有効なユーザーで登録すると詳細ページが表示されること" do
#         fill_in "企業名", with: "hogehoge"
#         fill_in "メールアドレス", with: "hogehoge@gmail.com"
#         fill_in "パスワード", with: "hogehoge"
#         fill_in "パスワード(確認用)", with: "hogehoge"
#         click_button "新しいアカウントを作成"
#         expect(page).to have_content "アカウント登録が完了しました。"
#         visit call_center_user_path(call_center_user)
#       end
#
#       it "無効なユーザーで登録すると登録が失敗すること" do
#         fill_in "企業名", with: ""
#         fill_in "メールアドレス", with: "hogehoge@gmail.com"
#         fill_in "パスワード", with: "hogehoge"
#         fill_in "パスワード(確認用)", with: "hoge"
#         click_button "新しいアカウントを作成"
#         expect(page).to have_content "エラーが発生したため保存されませんでした。"
#         visit new_call_center_user_registration_path
#       end
#     end
#   end
#
#   describe "ユーザーログインページ" do
#     let(:call_center_user) { create :call_center_user }
#
#     before do
#       visit new_call_center_user_session_path
#     end
#
#     it "無効なユーザーでログインするとログインが失敗すること" do
#       fill_in "メールアドレス", with: ""
#       fill_in "パスワード", with: ""
#       click_button "ログイン"
#       expect(page).to have_content "メールアドレスまたはパスワードが違います。"
#       visit new_call_center_user_registration_path
#     end
#
#     it "ログインからログアウトまで成功すること" do
#       log_in_as call_center_user
#       visit call_center_user_path(call_center_user)
#       expect(page).to have_content "ログアウト"
#       click_on "ログアウト"
#       visit root_path
#     end
#
#     it "ログアウトするとCookieがnilになること" do
#       check "ログイン情報を記憶する"
#       log_in_as call_center_user
#       delete destroy_call_center_user_session_path
#       expect(cookies[:remember_token]).to be_nil
#     end
#
#     it "マイページリンクのテスト" do
#       log_in_as call_center_user
#       click_on "マイページ"
#       expect(current_path).to eq "/call_center_users/#{call_center_user.id}"
#     end
#
#     it "ユーザー編集リンクのテスト" do
#       log_in_as call_center_user
#       click_on "ユーザー編集"
#       expect(current_path).to eq "/call_center_users/edit"
#     end
#
#     it "ログアウトリンクのテスト" do
#       log_in_as call_center_user
#       click_on "ログアウト"
#       visit root_path
#     end
#
#     it "新規登録のリンクを押すと新規登録ページに遷移すること" do
#       click_on "新規登録の方はこちらから"
#       expect(current_path).to eq new_call_center_user_registration_path
#     end
#   end
# end
