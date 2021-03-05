RSpec.describe "StaticPages", type: :request do
  describe "Topページ" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "正常なレスポンスを返すこと" do
      get privacy_path
      expect(response).to have_http_status(:success)
    end

    it "正常なレスポンスを返すこと" do
      get terms_path
      expect(response).to have_http_status(:success)
    end
  end
end
