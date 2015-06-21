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
    elsif @user.update_attributes(reset_params)
      login!(@user)
      flash[:success] = "Password has been reset."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Confirm a valid user.
  def valid_user
    unless (@user && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def reset_params
    params.require(:reset).permit(:password, :password_confirmation)
  end
end
