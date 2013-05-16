class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = params[:email]
    @user.type = params[:type]
    @user.first_name = session[:first_name] = params[:first_name]
    @user.last_name = session[:last_name] = params[:last_name]
    @user.account_id = params[:account_id]
    @user.phone = params[:phone]
    @user.mphone = params[:mphone]
    @user.fax = params[:fax]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to "/sessions/new"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.email = params[:email]
    @user.type = params[:type]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.account_id = params[:account_id]
    @user.phone = params[:phone]
    @user.mphone = params[:mphone]
    @user.fax = params[:fax]

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
