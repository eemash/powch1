class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
     if current_user.is_admin?
    @restaurant = Restaurant.new

     else
     redirect_to "/restaurants", :notice => "Sorry you're not an admin"
   end
  end

  def create
    if current_user.is_admin==true
       @restaurant = Restaurant.new
       @restaurant.name = params[:name]
       @restaurant.address = params[:address]
       @restaurant.city = params[:city]
       @restaurant.state = params[:state]
       @restaurant.zip = params[:zip]

        if @restaurant.save
          redirect_to "/restaurants", :notice => "Restaurant created successfully."
        else
          render 'new'
        end

    else
     redirect_to "/restaurants", :notice => "Sorry you're not an admin"
    end
  end

  def edit
  if current_user.is_admin==true
    @restaurant = Restaurant.find(params[:id])
      else
     redirect_to "/restaurants", :notice => "Sorry you're not an admin"
  end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.city = params[:city]
    @restaurant.state = params[:state]
    @restaurant.zip = params[:zip]

    if @restaurant.save
      redirect_to "/restaurants", :notice => "Restaurant updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.is_admin==true
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    redirect_to "/restaurants", :notice => "Restaurant deleted."
    else
     redirect_to "/restaurants", :notice => "Sorry you're not an admin"
   end
  end
end
