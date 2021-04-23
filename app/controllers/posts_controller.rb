class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @host_post = Post.left_joins(:user).where(user: { skill: false })
    @skill_post = Post.left_joins(:user).where(user: { skill: true })

    if params[:q].present?
      @host_posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : @host_post
      @search = @host_posts.ransack(params[:q])
      @host_posts = @search.result.includes(:user).page(params[:page]).per(10)

    else
      params[:q] = { sorts: 'id desc' }
      @host_posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : @host_post
      @search = @host_posts.ransack(params[:q])
      @host_posts = @search.result.includes(:user).page(params[:page]).per(10)
    end
    @sort_list = Post.sort_list
  end

  def new
    @post = current_user.posts.new
    @post.build_map
  end

  def show
    @post = Post.find(params[:id])
    @map = Map.find_by(post_id: @post.id)
    unless @map.nil?
      gon.latitude = @map.latitude
      gon.longitude = @map.longitude
    end

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
    @comment = Comment.new
    @comments = @post.comments

    @host_post = Post.left_joins(:user).where(user: { skill: false })
    @new_post = @host_post.order(created_at: :desc).where.not(id: @post.id).limit(2)
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(",")
    @map = Map.find_by(post_id: @post.id)
    return if @map.nil?

    gon.latitude = @map.latitude
    gon.longitude = @map.longitude
  end

  def create
    @post = current_user.posts.create(post_params)
    tag_list = params[:post][:tag_ids].split(',')
    if @post.save
      @post.save_tags(tag_list)

      latitude = params[:post][:map][:latitude]
      longitude = params[:post][:map][:longitude]
      address = params[:post][:map][:address]

      unless latitude.empty?
        @map = @post.build_map(
          latitude: latitude,
          longitude: longitude,
          address: address.slice(3, 30)
        )
        # @map.address = @map.address_search(latitude, longitude)
        @map.save
      end

      flash[:notice] = "投稿しました"
      redirect_to posts_path if current_user.skill == false
      redirect_to skill_posts_path if current_user.skill == true
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

      latitude = params[:post][:map][:latitude]
      longitude = params[:post][:map][:longitude]
      address = params[:post][:map][:address]
      unless latitude.empty?
        @map = @post.build_map(
          latitude: latitude,
          longitude: longitude,
          address: address.slice(3, 50)
        )
        @map.save
      end

      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path if current_user.skill == false
      redirect_to skill_posts_path if current_user.skill == true
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

  def skill
    @skill_post = Post.left_joins(:user).where(user: { skill: true })

    if params[:q].present?
      @skill_posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : @skill_post
      @search = @skill_posts.ransack(params[:q])
      @skill_posts = @search.result.includes(:user).page(params[:page]).per(10)

    else
      params[:q] = { sorts: 'id desc' }
      @skill_posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : @skill_post
      @search = @skill_posts.ransack(params[:q])
      @skill_posts = @search.result.includes(:user).page(params[:page]).per(10)
    end
    @sort_list = Post.sort_list
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :reward, :recruit_people, :start_date, :finish_date, :image, map_attributes: [:id, :address, :latitude, :longitude]).merge(user_id: current_user.id)
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
