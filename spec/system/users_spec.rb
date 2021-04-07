require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create :user }

  describe "ユーザー新規登録ページ" do
    before do
      visit new_user_registration_path
    end

    it "ロゴをクリックするとHomeへ遷移" do
      find(".logo").click
      expect(current_path).to eq root_path
    end

    it "ログインのリンクを押すとログインページに遷移すること" do
      click_on "すでにアカウントをお持ちの方はログイン"
      expect(current_path).to eq new_user_session_path
    end

    context "ユーザー新規登録処理" do
      it "有効なユーザーで登録すると詳細ページが表示されること" do
        fill_in "企業名", with: "hogehoge"
        fill_in "メールアドレス", with: "hogehoge@gmail.com"
        fill_in "パスワード", with: "hogehoge"
        fill_in "パスワード(確認用)", with: "hogehoge"
        click_button "新しいアカウントを作成"
        expect(page).to have_content "アカウント登録が完了しました。"
        visit user_path(user)
      end

      it "無効なユーザーで登録すると登録が失敗すること" do
        fill_in "企業名", with: ""
        fill_in "メールアドレス", with: "hogehoge@gmail.com"
        fill_in "パスワード", with: "hogehoge"
        fill_in "パスワード(確認用)", with: "hoge"
        click_button "新しいアカウントを作成"
        expect(page).to have_content "エラーが発生したため保存されませんでした。"
        visit new_user_registration_path
      end
    end
  end

  describe "ユーザーログインページ" do
    let(:user) { create :user }

    before do
      visit new_user_session_path
    end

    it "無効なユーザーでログインするとログインが失敗すること" do
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      click_button "ログイン"
      expect(page).to have_content "メールアドレスまたはパスワードが違います。"
      visit new_user_registration_path
    end

    it "新規登録のリンクを押すと新規登録ページに遷移すること" do
      click_on "新規登録の方はこちらから"
      expect(current_path).to eq new_user_registration_path
    end

    it "ログアウトするとCookieがnilになること" do
      check "ログイン情報を記憶する"
      log_in_as user
      delete destroy_user_session_path
      expect(cookies[:remember_token]).to be_nil
    end
  end

  describe "ユーザー削除" do
    let!(:user) { create :user }
    let!(:admin) { create :admin }

    it "ユーザー削除が成功する" do
      log_in_as user
      visit edit_user_registration_path
      find(".user_destroy_btn").click
      expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
    end

    it "管理者ユーザーは削除できない" do
      log_in_as admin
      visit edit_user_registration_path
      find(".user_destroy_btn").click
      expect(page).to have_content "ゲストユーザーの更新・削除はできません"
    end
  end
end
