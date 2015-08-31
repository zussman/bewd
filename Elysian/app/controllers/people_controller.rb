class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create person_params
    if @person.save
      redirect_to action: 'index'
      flash[:success] = "New person #{@person.first_name} #{@person.last_name} created!"
    else
      render action: 'new'
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  private
  def person_params
    params.require(:person).permit(:id, :first_name, :last_name, :email_id, :phone_number_id, :phone_type_id, emails_attributes: [:id, :address], phone_numbers_attributes: [:id, :phone_number, phone_types_attributes: [:id, :name]])
  end
end
