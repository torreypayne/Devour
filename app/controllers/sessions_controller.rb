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
      render :new
    end
  end

  def destroy
    logout!
    render json: {}
    # redirect_to new_session_url
  end
end
