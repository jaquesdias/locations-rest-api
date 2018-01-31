class PlacesController < ApplicationController
  def index
    set_page
    @places = Place.page(@page).order(:id)
    fresh_when @places

    render json: @places
  end

  def show
    set_place
    fresh_when @place

    render json: { place: @place, near_places: @place.nearbys }
  end

  def destroy
    set_place

    if @place.destroy
      render json: @place
    else
      render json: { status: 500, message: @place.errors.messages}
    end
  end

  private

  def set_place
    @place = Place.find_by(id: params[:id])
  end

  def set_page
    @page = params[:page].present? ? params[:page] : 1
  end

  def place_params
    params.require(:places).permit(:customer_id, :store_number, :street, :place, :zip_code, :store_name,:latitude, :longitude)
  end
end
