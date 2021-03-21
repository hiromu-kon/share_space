class PostsController < ApplicationController

  def index
    if params[:q].present?
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:user).page(params[:page]).per(10)
    else
      params[:q] = { sorts: 'id desc' }
      @q = Post.ransack(params[:q])
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
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
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
    if @post.update(post_params)
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
    @posts = @q.result.includes(:user).page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(user_id: current_user.id)
  end

  def call_center_post_params
    params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image).merge(call_center_user_id: current_call_center_user.id)
  end

  def search_params
    params.require(:q).permit(:sorts)
  end
end
