class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    #@restaurants = Restaurant.all
    @restaurants = Restaurant.where(deleted_at: nil)
  end

  def show
      # @restaurant  = Restaurant.find(params[:id]) # 只能找id
      # @restaurant  = Restaurant.find_by(id: params[:id]) # find_by 找不到會回傳 nil
      # Exception
      # Error
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # 寫入資料庫
    @restaurant = Restaurant.new(restaurant_params)
  
    if @restaurant.save
      redirect_to restaurants_path  # 等於 '/restaurants'
    # redirect -> 列表頁
    # render html: "title is #{params[:title]}"
    # redirect_to '/restaurants'
    else
      render :new   #借 new.html.erb 來用
    end
  end


  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    # @restaurant.update(deleted_at: Time.now)
    redirect_to restaurants_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :email, :address, :description)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
