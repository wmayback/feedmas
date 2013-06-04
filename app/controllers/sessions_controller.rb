class SessionsController < ApplicationController
  def new

  end

  def create

     @user = User.find_by_email(params[:email].downcase)

    if @user.present? && @user.authenticate(params[:password])
      session[:email] = @user.email
      if Account.find_by_id(@user.account_id).category == "Pantry"
        redirect_to foods_url
      else
        redirect_to users_url
      end
      flash[:notice] = "Sign-in success."
      session[:user_id] = @user.id
      session[:first_name] = @user.first_name
      session[:last_name] = @user.last_name
      session[:account_name] = Account.find_by_id(@user.account_id).account_name
      cookies[:new_account] = "false"
    else
      redirect_to "/sessions/new", notice: "Sign-in unsuccessful."
    end
  end

  def destroy
    reset_session
    redirect_to foods_url

  end
end
