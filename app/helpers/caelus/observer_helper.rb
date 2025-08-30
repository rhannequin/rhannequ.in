# frozen_string_literal: true

module Caelus
  module ObserverHelper
    def format_observer_coordinates(observer)
      latitude = observer.latitude.degrees
      longitude = observer.longitude.degrees
      latitude_cardinal = (latitude >= 0) ? "N" : "S"
      longitude_cardinal = (longitude >= 0) ? "E" : "W"

      [
        format("%.2f° %s", latitude.abs, latitude_cardinal),
        format("%.2f° %s", longitude.abs, longitude_cardinal)
      ].join(", ")
    end
  end
end
