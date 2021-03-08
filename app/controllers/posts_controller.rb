class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Postfind(params[:id])
  end

  def create
    @post = cuurent_call_center_user(post_params)
    @post = cuurent_host_user(post_params)
    if @room.save
      flash[:success] = "投稿しました"
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

    def post_params
      params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date).merge(call_center_user_id: current_call_center_user.id, host_user_id: host_user.id)
    end
end
