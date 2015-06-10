class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_credentials(user_params)
    if user
      login!(user)
      redirect_to :root
    else
      flash.now[:errors] = "Invalid Login information!"
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
