class HomesController < ApplicationController
  def index
    @homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.create home_params

    if @home.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def home_params
    params.require(:home).permit(:id, :account_number, :person_id, :residence_id, residences_attributes: [:id, :square_footage, :own, :apartment], people_attributes: [:id, :title, :first_name, :last_name, phone_numbers_attributes: [:id, :phone_number, phone_type_attributes: [:id, :name]], emails_attributes: [:id, :address]])
  end
end
