class LikesController < ApplicationController

  before_action :find_post

  def create
    @like = @post.likes.create(like_params)
    redirect_to post_path(@post)
  end


  #////////HOW TO UNLIKE A POST////////
  # def destroy
  #   if !(already_liked?)
  #     flash[:notice] = "Cannot unlike"
  #   else
  #     @like.destroy
  #   end
  #   redirect_to post_path(@post)
  # end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
  private
  def comment_params
    params.require(:comment).permit(:comment_body, :user_id, :like_option)
  end

end
