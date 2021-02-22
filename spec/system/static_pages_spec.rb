require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "static_pages#home" do
    before do
      visit root_path
    end

    it "logoをクリックするとトップページへ遷移" do
      find(".logo").click
      expect(current_path).to eq root_path
    end
  end
end
