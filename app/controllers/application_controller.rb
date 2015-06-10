class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login!(user)
    params[:session_token] = user.reset_session_token!
  end

  def logout!
    params[:session_token] = nil
    current_user.reset_session_token!
  end

  def current_user
    user = User.find_by_session_token(params[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def require_signed_in!
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
