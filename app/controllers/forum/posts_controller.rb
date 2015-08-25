class Forum::PostsController < ApplicationController
  def create
    sub_ids = post_params[:subs]
    post_params.delete(:subs)
    @post = Post.new(
      title: post_params[:title],
      url: post_params[:url],
      content: post_params[:content],
      user_id: current_user.id
    )
    if @post.save
      sub_ids.split('').each do |id|
        PostSub.create(post_id: @post.id, sub_id: id)
      end
      render json: @post
    else
      render json: @post.errors.full_messages, as: 422
    end
  end

  def index
  end

  def show
    @post = Post.includes(comments: :author).find(params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :subs)
  end
end
