class PhoneTypesController < ApplicationController

  def index
    @phone_types = PhoneType.all
  end

  def new
    @phone_type = PhoneType.new
  end

  def create
    @phone_type = PhoneType.create phone_type_params
    if @phone_type.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private
  def phone_type_params
    params.require(:phone_type).permit(:id, :name)
  end
end
