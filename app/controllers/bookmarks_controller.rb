class BookmarksController < ApplicationController
  before_action :authenticate_user!
  require 'csv'

  def create
    @post = Post.find(params[:post_id])
    @bookmark = current_user.bookmarks.build(post_id: params[:post_id])
    @bookmark.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  def index
    @posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_posts_csv(@posts)
      end
    end
  end

  private
  def send_posts_csv(posts)
    csv_data = CSV.generate do |csv|
      column_names = %w(投稿者名 タイトル 本文)
      csv << column_names
      posts.each do |post|
        column_values = [
          post.user.name,
          post.title,
          post.content,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "ブックマーク一覧.csv")
  end
end
