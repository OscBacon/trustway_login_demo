class SessionsController < ApplicationController
  def new
  end

  def create
    if !logged_in
      user = User.find_by(username: params[:session][:username].downcase)
      if user && params[:session][:password] == user.password
        puts "password is correct for " + user.username + "!"
        log_in user
        redirect_to user_path(user)
      else
        puts "login error"
        flash.now[:alert] = "用户名或密码错误！"
        render 'new'
      end
    else
      puts "user already logged in"
      redirect_to user_path(@current_user)
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
