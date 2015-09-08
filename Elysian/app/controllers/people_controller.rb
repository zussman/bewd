class PeopleController < ApplicationController

  respond_to :html, :json, :xml 
  
  def index
    @people = Person.all
    @lead_sources = LeadSource.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create person_params
    if @person.save
      redirect_to action: 'index'
      flash[:success] = "New person #{@person.full_name} created!"
    else
      render action: 'new'
    end
  end

  def show
    @person = Person.find(params[:id])

  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find params[:id]

    if @person.update_attributes person_params
      respond_with @person
    else
      render :action => :edit
    end
  end

  def destroy
    @person = Person.find params[:id]
    @person.destroy
    redirect_to people_path
  end

  private
  def person_params
    params.require(:person).permit(:id, :first_name, :last_name, :email_id, :phone_number_id, :phone_type_id, :home_id, homes_attributes: [:id], emails_attributes: [:id, :address], phone_numbers_attributes: [:id, :phone_number, phone_types_attributes: [:id, :name]])
  end
end
