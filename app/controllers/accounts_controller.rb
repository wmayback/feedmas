class AccountsController < ApplicationController

  def index
    @accounts = Account.all

  end

  def show
    @account = Account.find_by_id(params[:id])
    @users = User.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new
    @account.account_name = session[:account_name] = params[:account_name]
    @account.phone = session[:phone] = params[:phone]
    @account.address_line1 = params[:address_line1]
    @account.address_line2 = params[:address_line2]
    @account.city = params[:city]
    @account.state = params[:state]
    @account.postcode = params[:postcode]
    @account.category = params[:category]
    @account.image = params[:image]


    if @account.save
      cookies[:new_account] = "true"
      # session[:account_id] = @account.id
      redirect_to new_user_url
    else
      render 'new'
    end


  end

  def edit
    @account = Account.find_by_id(params[:id])
  end

  def update
    @account = Account.find_by_id(params[:id])
    @account.account_name = params[:account_name]
    @account.phone = params[:phone]
    @account.address_line1 = params[:address_line1]
    @account.address_line2 = params[:address_line2]
    @account.city = params[:city]
    @account.state = params[:state]
    @account.postcode = params[:postcode]
    @account.postcode = params[:postcode]
    @account.category = params[:category]
    @account.logo = params[:logo]

    if @account.save
      redirect_to accounts_url
    else
      render 'new'
    end
  end

  def destroy
    @account = Account.find_by_id(params[:id])
    @account.destroy
    redirect_to accounts_url
  end
end
