class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:q].present?
      @q = Post.ransack(params[:q])
      @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      @posts = @q.result.includes(:user).page(params[:page]).per(10)
    else
      params[:q] = { sorts: 'id desc' }
      @q = Post.ransack(params[:q])
      @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      @posts = @q.result.includes(:user).page(params[:page]).per(10)
    end
  end

  def new
    @post = current_user.posts.new
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

    user = @post.user
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @UserEntry = Entry.where(user_id: user.id)
      unless user.id == current_user.id
        @currentUserEntry.each do |cu|
          @UserEntry.each do |u|
            if cu.room_id == u.room_id
              @haveRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @haveRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end

    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(",")
  end

  def create
    @post = current_user.posts.create(post_params)
    tag_list = params[:post][:tag_ids].split(',')
    if @post.save
      @post.save_tags(tag_list)
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿できませんでした。入力内容を見直してください。"
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_ids].split(',')
    if @post.update(post_params)
      @post.save_tags(tag_list)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path
    else
      flash[:alert] = "投稿を編集できませんでした"
      redirect_to edit_post_path
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  def search
    @q = Post.search(search_params)
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @q.result.includes(:user).page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit(:sorts)
  end

  def correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user || current_user.admin?
      flash[:alert] = "権限がありません"
      redirect_to root_url
    end
  end
end
