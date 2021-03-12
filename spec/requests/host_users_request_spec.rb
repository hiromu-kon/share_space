require 'rails_helper'

RSpec.describe "HostUsers", type: :request do
  describe "ユーザー登録" do
    before do
      get new_host_user_registration_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "新規登録で表示されているタイトルのテスト" do
      expect(response.body).to include "ホスト企業専用"
      expect(response.body).to include "新規登録"
    end

    it "新規登録での表示テスト" do
      expect(response.body).to include "企業名"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワード"
      expect(response.body).to include "パスワード(確認用)"
      expect(response.body).to include "新しいアカウントを作成"
      expect(response.body).to include "すでにアカウントをお持ちの方はログイン"
    end
  end

  describe "ユーザーログイン" do
    before do
      get new_host_user_session_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "ログインページで表示されている見出しのテスト" do
      expect(response.body).to include "ホスト企業専用"
      expect(response.body).to include "ログイン"
    end

    it "ログインページでの表示テスト" do
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワード"
      expect(response.body).to include "ログイン情報を記憶する"
      expect(response.body).to include "新規登録の方はこちらから"
      expect(response.body).to include "ゲストとしてログイン"
    end
  end

  describe "ユーザー詳細" do
    let(:host_user) { create :host_user }

    before do
      sign_in_as host_user
      get host_user_path(host_user.id)
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "詳細ページでの表示テスト" do
      expect(response.body).to include host_user.name
      expect(response.body).to include host_user.industry
      expect(response.body).to include host_user.introduction
      expect(response.body).to include host_user.prefectures
      expect(response.body).to include "会社情報"
    end
  end

  describe "ユーザー編集" do
    let!(:host_user) { create :host_user }

    before do
      sign_in_as host_user
      get edit_host_user_registration_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "編集ページでの表示テスト" do
      expect(response.body).to include "企業名"
      expect(response.body).to include "メールアドレス"
      expect(response.body).to include "パスワード"
      expect(response.body).to include "パスワード(確認用)"
      expect(response.body).to include "活動拠点"
      expect(response.body).to include "ホームページ"
      expect(response.body).to include "業界"
      expect(response.body).to include "従業員数"
      expect(response.body).to include "企業紹介"
      expect(response.body).to include "ヘッダー画像"
      expect(response.body).to include "プロフィール画像"
      expect(response.body).to include "アカウントを削除する"
    end
  end
end
