class UpdateCoordinatesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    places_to_updated = Place.where(latitude: nil, longitude: nil).limit(2000)

    places_to_updated.each do |place|
      coordinates = place.geocode

      puts "Place id: #{place.id} | Geocode: #{coordinates.inspect}"
      place.update(latitude: coordinates.first, longitude: coordinates.last) if coordinates.present?

      sleep 0.3
    end
  end
end
