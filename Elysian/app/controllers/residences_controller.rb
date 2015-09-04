class ResidencesController < ApplicationController
  def index
    @residences ||= Residence.all
  end

  def new
    @residence = Residence.new
    @homes = @residence.homes.build
    @person = @homes.build_person
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
    params.require(:residence).permit(:id, :square_footage, :own, :apartment, :address_id, :city_id, :state_id, :zip_id, :utility_id, addresses_attributes: [:id, :line_1, :line_2, cities_attributes: [:id, :name], zips_attributes: [:id, :zipcode]], homes_attributes: [:id, :account_number, person_attributes: [:id, :first_name, :last_name]])
  end
end
