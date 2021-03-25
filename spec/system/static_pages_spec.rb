require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "Topページ" do
    context "ユーザーがログインしていないとき" do
      before do
        visit root_path
      end

      it "ログインリンクのテスト" do
        click_on "ホスト企業 | 新規登録orログイン"
        expect(current_path).to eq new_user_session_path
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
  end
end
