# require 'rails_helper'
#
# RSpec.describe "CallCenterUsers", type: :request do
#   describe "ユーザー新規登録" do
#     before do
#       get new_call_center_user_registration_path
#     end
#
#     it "正常なレスポンスを返すこと" do
#       expect(response).to have_http_status(:success)
#     end
#
#     it "新規登録で表示されているタイトルのテスト" do
#       expect(response.body).to include "コールセンター専用"
#       expect(response.body).to include "新規登録"
#     end
#
#     it "新規登録での表示のテスト" do
#       expect(response.body).to include "企業名"
#       expect(response.body).to include "メールアドレス"
#       expect(response.body).to include "パスワード"
#       expect(response.body).to include "パスワード(確認用)"
#       expect(response.body).to include "新しいアカウントを作成"
#       expect(response.body).to include "すでにアカウントをお持ちの方はログイン"
#     end
#   end
#
#   describe "ユーザーログイン" do
#     before do
#       get new_call_center_user_session_path
#     end
#
#     it "正常なレスポンスを返すこと" do
#       expect(response).to have_http_status(:success)
#     end
#
#     it "ログインページで表示されている見出しのテスト" do
#       expect(response.body).to include "コールセンター専用"
#       expect(response.body).to include "ログイン"
#     end
#
#     it "ログインページでの表示テスト" do
#       expect(response.body).to include "メールアドレス"
#       expect(response.body).to include "パスワード"
#       expect(response.body).to include "新規登録の方はこちらから"
#       expect(response.body).to include "ログイン情報を記憶する"
#       expect(response.body).to include "ゲストとしてログイン"
#     end
#   end
#
#   describe "ユーザー詳細" do
#     let(:call_center_user) { create :call_center_user }
#
#     before do
#       sign_in_as call_center_user
#       get call_center_user_path(call_center_user.id)
#     end
#
#     it "正常なレスポンスを返すこと" do
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
