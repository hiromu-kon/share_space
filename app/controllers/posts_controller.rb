class PostsController < ApplicationController

  def index
    if params[:q].present?
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:host_user).page(params[:page]).per(10)
    else
      params[:q] = { sorts: 'id desc' }
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:host_user).page(params[:page]).per(10)
    end
  end

  def new
    @post = current_host_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
    @pv = Pv.find_by(ip: request.remote_ip)
    if @pv
      @post = Post.find(params[:id])
    else
      @post = Post.find(params[:id])
      Pv.create(ip: request.remote_ip)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_host_user.posts.create(host_post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to posts_path
    else
      flash.now[:danger] = "投稿できませんでした。入力内容を見直してください。"
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(host_post_params)
      flash[:success] = "投稿を編集しました"
      redirect_to post_path
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

  def search
    @q = Post.search(search_params)
    @posts = @q.result.includes(:host_user).page(params[:page]).per(10)
  end

  private

  def host_post_params
    params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(host_user_id: current_host_user.id)
  end

  def call_center_post_params
    params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(call_center_user_id: current_call_center_user.id)
  end

  def search_params
    params.require(:q).permit(:sorts)
  end
end
