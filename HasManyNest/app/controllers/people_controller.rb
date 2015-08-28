class PeopleController < ApplicationController
  def index
    @people = Person.new
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new (person_params)
  end

  def _form
  end

  private
  def person_params
    params.require(:person).permit(:id, :first_name, :last_name, person_phones_attributes: [:id, :phone_attributes: [:id]])
end
