class PlacesController < ApplicationController
  before_action :authenticate_user

  def index
    set_page
    @places = Place.page(@page).order(:id)
    fresh_when @places

    render json: @places
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      render json: @place.id
    else
      render json: { status: 500, message: @place.errors.messages}
    end
  end

  def update
    set_place
    if @place.update(place_params)
      render json: @place.id
    else
      render json: { status: 500, message: @place.errors.messages}
    end
  end

  def show
    set_place
    set_distance
    fresh_when @place

    render json: { place: @place, near_places: @place.nearbys(@distance) }
  end

  def destroy
    set_place

    if @place.destroy
      render json: @place
    else
      render json: { status: 500, message: @place.errors.messages}
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: error.message }, status: :not_found
  end

  private

  def set_place
    @place = Place.find_by(id: params[:id])
  end

  def set_page
    @page = params[:page].present? ? params[:page] : 1
  end

  def set_distance
    @distance = params[:distance].present? ? params[:distance].to_i : 10
  end

  def place_params
    params.require(:place).permit(:customer_id, :store_number, :street, :place, :zip_code, :store_name)
  end
end
