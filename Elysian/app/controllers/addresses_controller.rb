class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.create address_params
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def edit
    @address = Address.find params[:id]
  end

  def update
    @address = Address.find params[:id]
    if @address.update_attributes params[:address]
      redirect_to addresses_path
    else
      render :action => :edit
    end
  end

  def destroy
    @address = Address.find params[:id]
    @address.destroy
    redirect_to addresses_path
  end

  def show
    @address = Address.find params[:id]
  end

  private
  def address_params
    params.require(:address).permit(:id, :line_1, :line_2, :city_id, :state_id, :zip_id, cities_attributes: [:id, :name, :_destroy], states_attributes: [:id, :name, :abbreviation, :_destroy], zips_attributes: [:id, :zipcode, :_destroy])
  end
end
