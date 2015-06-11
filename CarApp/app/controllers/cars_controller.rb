class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new car_params

    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(params[:car])
      redirect_to @car
    else
      render 'edit'
    end
  end

  private
  def car_params
    params.require(:car).permit(:name, :year, manufacturer_attributes: [:make])
  end
end
