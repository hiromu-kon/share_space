require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create :post }

  describe '#create' do
    it "正しくPostが保存できるか" do
      expect(build(:post)).to be_valid
    end
  end

  it "タイトルがnilの場合無効である" do
    post.title = nil
    expect(post).not_to be_valid
  end

  it "タイトルが空白の場合無効である" do
    post.title = " "
    expect(post).not_to be_valid
  end

  it "Userがnilの場合無効である" do
    post.user = nil
    expect(post).not_to be_valid
  end

  it "Contentがnilの場合無効である" do
    post.content = nil
    expect(post).not_to be_valid
  end

  it "Contentが空白の場合無効である" do
    post.content = " "
    expect(post).not_to be_valid
  end

  it "報酬がnilの場合無効である" do
    post.reward = nil
    expect(post).not_to be_valid
  end

  it "報酬が空白の場合無効である" do
    post.reward = " "
    expect(post).not_to be_valid
  end

  it "募集人数がnilの場合無効である" do
    post.recruit_people = nil
    expect(post).not_to be_valid
  end

  it "募集人数が空白の場合無効である" do
    post.recruit_people = " "
    expect(post).not_to be_valid
  end

  it "タイトルが81文字の場合無効である" do
    post.title = "a" * 81
    expect(post).not_to be_valid
  end

  it "タイトルが79文字の場合有効である" do
    post.title = "a" * 79
    expect(post).to be_valid
  end

  it "Contentが601文字の場合無効である" do
    post.content = "a" * 601
    expect(post).not_to be_valid
  end

  it "Contentが599文字の場合有効である" do
    post.content = "a" * 599
    expect(post).to be_valid
  end
end
