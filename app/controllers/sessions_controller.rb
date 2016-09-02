class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      redirect_to new_list_path
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
      redirect_to root_path
    end

  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "Thanks for stopping by!"
    end
    redirect_to root_path
  end
end
