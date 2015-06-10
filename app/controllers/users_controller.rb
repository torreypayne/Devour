class UsersController < ApplicationController

  before_action :ensure_logged_in, only: :index

  def new
    @user = User.new
  end

  def create
    user = User.new(email: user_params[:email], password: user_params[:password])
    if user.save
      render json: user
    else
      flash.now[:errors] = user.errors.full_messages
      render json: user.errors.full_messages, as: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users
  end

  def update
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def ensure_logged_in
    if !logged_in?
      redirect_to new_session_url
    end
  end
end
