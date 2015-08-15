class Forum::SubsController < ApplicationController
  def new
  end

  def index
    @subs = Sub.all
    render json: @subs.includes(:posts)
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      render json: @sub
    else
      render json: @sub.errors.full_messages, as: :unprocessable_entity
    end
  end

  def destroy
  end

  def show
    @sub = Sub.includes(:posts).find(params[:id])
    render :show
  end

  def update
  end

  def edit
  end

  private
  def require_user_owns_sub!
    return if Sub.find(params[:id]).moderator == current_user
    render json: "Forbidden", status: :forbidden
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
