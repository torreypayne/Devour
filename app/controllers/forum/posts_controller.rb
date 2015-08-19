class Forum::PostsController < ApplicationController
  def create
  end

  def index
  end

  def show
    puts "hitting show action"
    @post = Post.includes(:comments).find(params[:id])
    render :show
  end
end
