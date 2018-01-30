class PlacesController < ApplicationController
  def index
    set_page
    @places = Place.page(@page)
    fresh_when @places

    render json: @places
  end


  private

  def set_page
    @page = params[:page].present? ? params[:page] : 1
  end
end
