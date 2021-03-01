require 'rails_helper'

RSpec.describe "HostUsers", type: :request do

  describe "GET /new" do
    before do
      get new_host_user_registration_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "there is a new registration screen" do
      expect(response.body).to include "ホスト企業専用"
      expect(response.body).to include "新規登録"
    end

    it "label display test" do
      expect(response.body).to include "企業名"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワード(6文字以上)"
      expect(response.body).to include "パスワード(確認用)"
      expect(response.body).to include "新しいアカウントを作成"
      expect(response.body).to include "すでにアカウントをお持ちの方はログイン"
    end
  end

  describe "GET /show" do
    before do
      get host_users_show_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end
  end
end
