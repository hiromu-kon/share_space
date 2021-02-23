RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "正常なレスポンスを返すこと" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
