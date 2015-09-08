class ResidencesController < ApplicationController
  def index
    @residences ||= Residence.all
  end

  def new
    @residence = Residence.new
  end

  def show
    @residence = Residence.find params[:id]
  end

  def create
    @residence = Residence.create residence_params
    if @residence.save
      redirect_to residences_path
    else
      render 'new'
    end
  end

  def edit
    @residence = Residence.find params[:id]
  end

  def update
    @residence = Residence.find params[:id]
    if @residence.update_attributes params[:residence]
      redirect_to residences_path
    else
      render :action => :edit
    end
  end

  def destroy
    @residence = Residence.find params[:id]
    @residence.destroy
    redirect_to residences_path
  end

  private
  def residence_params
    params.require(:residence).permit(:square_footage, :own, :apartment, :address_id, :city_id, :state_id, :zip_id, :utility_id, :home_id, homes_attributes: [:id], addresses_attributes: [:id, :line_1, :line_2, cities_attributes: [:id, :name], zips_attributes: [:id, :zipcode]])
  end
end
