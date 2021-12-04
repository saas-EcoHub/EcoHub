class CommentsController < ApplicationController
  def new
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @promotion = Promotion.find params[:promotion_id]
    @comment = @promotion.comments.new(parent_id: params[:parent_id])
  end

  def create
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @promotion = Promotion.find params[:promotion_id]
    @comment = @promotion.comments.new comments_params
    @comment.user = Current.user
    @comment.parent = @comment if @comment.parent.nil?
    @comment.save!
    redirect_back fallback_location: root_path
  end

  def upvote
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @comment = Comment.find(params[:comment_id])
    @comment.vote_by voter: Current.user, vote: 'like'
    redirect_back fallback_location: root_path
  end

  def downvote
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @comment = Comment.find(params[:comment_id])
    @comment.vote_by voter: Current.user, vote: 'bad'
    redirect_back fallback_location: root_path
  end

  def unvote
    @comment = Comment.find(params[:comment_id])
    Current.user.unvote_for @comment
    redirect_back fallback_location: root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:parent_id, :content)
  end
end
