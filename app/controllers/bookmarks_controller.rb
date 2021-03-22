class BookmarksController < ApplicationController
  before_action :authenticate_user!

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
  end
end
