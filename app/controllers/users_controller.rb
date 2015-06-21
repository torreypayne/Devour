class UsersController < ApplicationController

  before_action :ensure_logged_in, only: :index

  def new
    # @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to root_url
      AuthMailer.signup_email(@user).deliver
    else
      flash.now[:errors] = @user.errors
      render :new
    end
  end

  def guest_login
    fake_password = Faker::Internet.password
    user = User.new(email: Faker::Internet.email, password: fake_password, password_confirmation: fake_password)
    login!(user)
    redirect_to root_url
  end

  def index
    @users = User.all
    render :index
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
