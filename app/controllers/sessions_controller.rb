class SessionsController < ApplicationController
  def new

  end

  def create

     @user = User.find_by_email(params[:email])

    if @user.present? && @user.authenticate(params[:password])
      session[:email] = @user.email
      redirect_to foods_url
      flash[:notice] = "Sign-in success."
      session[:user_id] = @user.id
      session[:first_name] = @user.first_name
      session[:last_name] = @user.last_name
      session[:account_name] = Account.find_by_id(@user.account_id).account_name
    else
      redirect_to "/sessions/new", notice: "Sign-in unsuccessful."
    end
  end

  def destroy
    reset_session
    redirect_to foods_url

  end
end
