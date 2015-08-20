class PhoneTypesController < ApplicationController

  def index
    @phone_types = PhoneType.all
  end

  def show
    @phone_type = PhoneType.find(params[:id])
  end

  def new
    @phone_type = PhoneType.new
  end

  def edit
    @phone_type = PhoneType.find(params[:id])
  end

  def create
    @phone_type = PhoneType.create phone_type_params

    if @phone_type.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @phone_type = PhoneType.find(params[:id])

    if @phone_type.update(phone_type_params)
      redirect_to @phone_type
    else
      render 'edit'
    end
  end

  def destroy
    @phone_type = PhoneType.find(params[:id])
    @phone_type.destroy
    redirect_to action: :index
  end

  private
    def phone_type_params
      params.require(:phone_type).permit(:name, phones_attributes: [:id, :number, :_destroy])
    end

end
