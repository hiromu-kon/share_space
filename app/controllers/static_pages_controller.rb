class StaticPagesController < ApplicationController
  def home
    @new_post = Post.order(created_at: :desc).limit(4)
  end

  def terms
  end

  def privacy
  end
end
