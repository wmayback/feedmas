class FoodsController < ApplicationController
  before_filter :define_food, :except => [:index, :new, :create]
 layout false
  def define_food
    @food = Food.find_by_id(params[:id])
  end

  def index
    @foods = Food.all
    @json = Account.all.to_gmaps4rails
    render layout: "main_page.html.erb"
  end

  def show

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js { render :layout => false }
    end
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new
    @food.status = params[:status]
    @food.user_id = params[:user_id]
    @food.description = params[:description]


    if @food.save
      redirect_to foods_url
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    @food.status = params[:status]
    @food.user_id = params[:user_id]
    @food.description = params[:description]
    @food.user_id = params[:user_id]
    @food.claimant = params[:claimant]


    if @food.save
      redirect_to foods_url
    else
      render 'new'
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_url
  end
end
