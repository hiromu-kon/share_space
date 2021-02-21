require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "title_test" do
    let!(:BASE_TITLE) { "ShareSpace" }

    context "page_titleがnilのとき" do
      it "full_titleはShareSpaceのみを返す" do
        expect(full_title(nil)).to eq Const::BASE_TITLE
      end
    end

    context "page_titleが空白のとき" do
      it "full_titleはShareSpaceのみを返す" do
        expect(full_title("")).to eq Const::BASE_TITLE
      end
    end

    context "page_titleがtestのとき" do
      it "full_titleはtest - BASE_TITLEを返す" do
        expect(full_title("test")).to eq "test - #{Const::BASE_TITLE}"
      end
    end
  end
end
