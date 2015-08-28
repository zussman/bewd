class PeopleController < ApplicationController
  def index
    @people = Person.all
    respond_to do |format|
      format.html
      format.json { render json: PeopleDatatable.ner(view_context) }
    end
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create person_params
    if @person.save
      render action: 'index'
    else
      render action: 'new'
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  private
  def person_params
    params.require(:person).permit(:id, :first_name, :last_name)
  end
end
