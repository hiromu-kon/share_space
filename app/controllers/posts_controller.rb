class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = current_host_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_host_user.posts.create(host_post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flash[:danger] = "投稿できませんでした。入力内容を見直してください。"
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を編集しました"
      redirect_to posts_path
    else
      flash[:danger] = "投稿を編集できませんでした"
      redirect_to edit_post_path
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_path
  end

  private

    def host_post_params
      params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(host_user_id: current_host_user.id)
    end

    def call_center_post_params
      params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(call_center_user_id: current_call_center_user.id)
    end
end