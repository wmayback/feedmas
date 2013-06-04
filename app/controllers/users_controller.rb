class UsersController < ApplicationController

   before_filter :define_user, :except => [:index, :new, :create]
   before_filter :authorize_account, :only => [:edit, :update, :destroy]

  def authorize_account
    @user = User.find(params[:id])

    #@user.account_id != session[:email]

    if Account.find_by_id(@user.account_id).account_name != session[:account_name]
      redirect_to users_url, notice: "Unauthorized User"
    end
  end

  def define_user
    @user = User.find_by_id(params[:id])

  end

  def index
    @users = User.all
    @foods = current_user.account.foods
  end

  def show
    @user
  end

  def new
    @user
  end

  def create
    @user = User.new

    # = session[:first_name]
    # = session[:last_name]

    @user.email = params[:email]
    @user.first_name = params[:first_name]
    @user.admin = params[:admin]
    @user.last_name  = params[:last_name]
    @user.account_id = params[:account_id]
    @user.phone = params[:phone]
    @user.mphone = params[:mphone]
    @user.fax = params[:fax]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if session[:first_name].present? && @user.save
      redirect_to "/users"
    elsif @user.save
      redirect_to "/sessions/new"
    else
      render 'new'
    end
  end

  def edit
    @user
  end

  def update
    @user.email = params[:email]
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
    @user.destroy
    redirect_to users_url
  end
end
