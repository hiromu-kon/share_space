require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create :post }

  describe 'Postの作成ページ' do
    it "正しくPostが保存できるか" do
      expect(build(:post)).to be_valid
    end
  end

  it "post is success" do
    expect(post).to be_valid
  end

  it "title is nil" do
    post.title = nil
    expect(post).not_to be_valid
  end

  it "title is present" do
    post.title = " "
    expect(post).not_to be_valid
  end

  it "user is nil" do
    post.host_user = nil
    expect(post).not_to be_valid
  end

  it "content is nil" do
    post.content = nil
    expect(post).not_to be_valid
  end

  it "content is present" do
    post.content = " "
    expect(post).not_to be_valid
  end

  it "reward is nil" do
    post.reward = nil
    expect(post).not_to be_valid
  end

  it "reward is present" do
    post.reward = " "
    expect(post).not_to be_valid
  end

  it "recruit_people is nil" do
    post.recruit_people = nil
    expect(post).not_to be_valid
  end

  it "recruit_people is present" do
    post.recruit_people = " "
    expect(post).not_to be_valid
  end

  it "title is 81 characters" do
    post.title = "a" * 81
    expect(post).not_to be_valid
  end

  it "title is 79 characters" do
    post.title = "a" * 79
    expect(post).to be_valid
  end

  it "content is 601 characters" do
    post.content = "a" * 601
    expect(post).not_to be_valid
  end

  it "content is 599 characters" do
    post.content = "a" * 599
    expect(post).to be_valid
  end
end
