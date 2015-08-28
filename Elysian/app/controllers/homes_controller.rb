class HomesController < ApplicationController
  def index
    @homes = Home.all
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.create home_params
    if @home.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def show
    @home = Home.find(params[:id])
  end

  private
  def home_params
    params.require(:home).permit(:id, :square_footage, :own, :apartment, people_attributes: [:id, :first_name, :last_name, emails_attributes: [:id, :address], phone_numbers_attributes: [:id, :phone_number]], addresses_attributes: [:id])
  end
end
