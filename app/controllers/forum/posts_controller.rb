class Forum::PostsController < ApplicationController
  def create
  end

  def index
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    render :show
  end
end
