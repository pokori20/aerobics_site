class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # 有効なユーザーかつ正しいパスワード(true && true) == true
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "ログインしました"
      log_in user
      remember user
      redirect_to admin_path
    else
      flash.now[:alert] = "入力内容を確認してください"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
