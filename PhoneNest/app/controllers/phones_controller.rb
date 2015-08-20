class PhonesController < ApplicationController

  def index
    @phones = Phone.all
  end

  def show
    @phone = Phone.find(params[:id])
  end

  def new
    @phone = Phone.new
  end

  def edit
    @phone = Phone.find(params[:id])
  end

  def create
    @phone = Phone.create phone_params

    if @phone.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @phone = Phone.find(params[:id])

    if @phone.update(phone_params)
      redirect_to @phone
    else
      render 'edit'
    end
  end

  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy
    redirect_to action: :index
  end

  private
    def phone_params
      params.require(:phone).permit(:number, :phone_type_id, phone_types_attributes: [:id, :name, :_destroy])
    end
end