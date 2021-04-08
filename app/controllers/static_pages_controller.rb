class StaticPagesController < ApplicationController
  def home
    @post = Post.left_joins(:user).where(user: { skill: false })
    @new_post = @post.order(created_at: :desc).limit(6)
  end

  def terms
  end

  def privacy
  end
end
