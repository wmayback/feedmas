class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find_by_id(params[:id])
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
    @food = Food.find_by_id(params[:id])
  end

  def update
    @food = Food.find_by_id(params[:id])
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
    @food = Food.find_by_id(params[:id])
    @food.destroy
    redirect_to foods_url
  end
end
