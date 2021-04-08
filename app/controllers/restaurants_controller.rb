class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant  = Restaurant.find(params[:id]) # 只能找id
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
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :email, :address, :description)
    end
end
