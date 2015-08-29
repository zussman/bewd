class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.new
  end

  def create
    @state = State.create state_params
    if @state.save
      redirect_to states_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def state_params
    params.require(:state).permit(:id, :name, :abbreviation)
  end
end
