require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Postの作成ページ' do
    context 'Postが保存できるとき' do
      it "正しくPostが保存できるか" do
        expect(build(:post)).to be_valid
      end
    end
  end
end
