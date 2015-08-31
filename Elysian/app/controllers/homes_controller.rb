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
    params.require(:home).permit(:id, :person_id, :residence_id, residences_attributes: [:id, :square_footage, :own, :apartment, :account_number], people_attributes: [:id, :first_name, :last_name])
  end
end
