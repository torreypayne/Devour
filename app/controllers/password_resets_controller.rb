class PasswordResetsController < ApplicationController
  before_action :get_user,    only: [:edit, :update]
  before_action :valid_user,  only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      AuthMailer.reset_password_email(@user).deliver
      flash[:info] = "Email sent with password reset instructions"
      redirect_to new_session_url
    else
      flash.now[:danger] = "Email address not found"
      render :new
    end
  end

  def new
  end

  def edit

  end

  def update
    if params[:user][:password].empty?
      flash.now[:danger] = "Password can't be empty"
      render 'edit'
    else
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.save!
      login!(@user)
      flash[:success] = "Password has been reset."
      redirect_to root_url
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirm a valid user.
  def valid_user
    unless (@user && @user.authenticated?(:password_reset, params[:id]))
      redirect_to root_url
    end
  end

  def reset_params
    params.require(:reset).permit(:password, :password_confirmation)
  end

  def check_expiration
    @user.password_reset_sent_at < 2.hours.ago
  end
end
