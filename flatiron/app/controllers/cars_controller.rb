class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    make = @car.makes.build
    make.pricings.build
  end

  def show
  end

  def create
    @car = Car.new car_params
    if @car.save
      redirect_to edit_car_path(@car), notice: "Car created successfully"
    else
      redirect_to new_car_path(@car), notice: "Car could not be created"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
end
