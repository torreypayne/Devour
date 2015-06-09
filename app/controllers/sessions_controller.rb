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
  end
end
