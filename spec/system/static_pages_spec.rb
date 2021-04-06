require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "Topページ" do
    context "ユーザーがログインしていないとき" do
      before do
        visit root_path
      end

      it "ログインリンクのテスト" do
        click_on "ログイン"
        expect(current_path).to eq new_user_session_path
      end

      it "新規登録リンクのテスト" do
        click_on "ログイン"
        expect(current_path).to eq new_user_session_path
      end

      it "ゲストログインリンクのテスト" do
        click_on "ゲストログイン"
        expect(current_path).to eq root_path
      end

      it "ロゴをクリックするとHomeへ遷移" do
        find(".logo").click
        expect(current_path).to eq root_path
      end

      it "利用規約へのリンクのテスト" do
        click_on "利用規約"
        expect(current_path).to eq terms_path
      end

      it "プライバシーポリシーへのリンクのテスト" do
        click_on "プライバシーポリシー"
        expect(current_path).to eq privacy_path
      end
    end

    context "ユーザーがログインしたとき" do
      let!(:user) { create :user }
      let!(:admin) { create :admin }

      before do
        log_in_as user
      end

      it "マイページへのリンク" do
        find('.mypage_link').click
        expect(current_path).to eq user_path(user)
      end

      it "ユーザー編集へのリンク" do
        find('.user_edit_link').click
        expect(current_path).to eq edit_user_registration_path
      end

      it "ブックマークへのリンク" do
        find('.bookmark_link').click
        expect(current_path).to eq user_bookmarks_path(user)
      end

      it "ログアウトへのリンク" do
        find('.logout_link').click
        expect(current_path).to eq root_path
      end

      it "投稿を探すへのリンク" do
        find('.post_link').click
        expect(current_path).to posts_path
      end

      it "メッセージへのリンク" do
        find('.room_link').click
        expect(current_path).to rooms_path
      end
    end
  end
end
