class Forum::PostsController < ApplicationController
  def create
  end

  def index
  end

  def show
    puts "hitting show action"
    @post = Post.includes(comments: :author).find(params[:id])
    render :show
  end
end
