class UsersController < ApplicationController
  def create
    #user = User.new(user_params)
    respond_to do |format|
      format.js
    end
  end

  def show
    if logged_in
      @user = @current_user
      if request.params[:id].to_i != @user[:id]
        redirect_to user_path(@user)
      end
    else
      redirect_to root_path
      flash.now[:alert] = "你要登录！"
    end
  end
  def user_params
    params.require(:user).permit(:username,:password,:email)
  end
end
