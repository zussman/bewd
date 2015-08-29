class ZipsController < ApplicationController
  def index
    @zips = Zip.all
  end

  def show
    @zip = Zip.find(params[:id])
  end

  def new
    @zip = Zip.new
  end

  def create
    @zip = Zip.create zip_params
    if @zip.save
      redirect_to zips_path
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
  def zip_params
    params.require(:zip).permit(:id, :zipcode)
  end
end
