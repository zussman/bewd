class PhoneNumbersController < ApplicationController
  def index
    @phone_numbers = PhoneNumber.all
  end

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = PhoneNumber.create phone_number_params
    if @phone_number.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end

  def update
  end

  def show
    @phone_number = PhoneNumber.find(params[:id])    
  end

  def destroy
  end

  private
  def phone_number_params
    params.require(:phone_number).permit(:id, :phone_number, :phone_type_id)
  end
end
