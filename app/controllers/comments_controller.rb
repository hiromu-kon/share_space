class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
      respond_to do |format|
        format.html { redirect_to post_url(@post) }
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
