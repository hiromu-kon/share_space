require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "Post一覧ページ" do
    let(:user) { create :user }
    let(:post) { create :post }

    before do
      sign_in_as user
      get "/posts"
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status(:success)
    end

    it "Post一覧ページでの表示テスト" do
      expect(response.body).to include "募集する"
      expect(response.body).to include "募集一覧"
      expect(response.body).to include "検索条件"
      expect(response.body).to include post.title
      expect(response.body).to include post.content
      expect(response.body).to include post.reward
      expect(response.body).to include post.recruit_people
      expect(response.body).to include post.start_date
      expect(response.body).to include post.finish_date
    end
  end
end
