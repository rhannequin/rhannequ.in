# frozen_string_literal: true

module Caelus
  class ApplicationController < ActionController::Base
    DEFAULT_LOCATION = [48.85341, 2.3488] # Paris, France
    DEFAULT_TIME_ZONE = "Europe/Paris"

    before_action :set_observer

    layout "caelus"

    private

    def default_utc_offset
      Time
        .zone
        .now
        .in_time_zone(DEFAULT_TIME_ZONE)
        .formatted_offset
    end

    def set_observer
      latitude = (cookies.signed[:latitude] || DEFAULT_LOCATION.first).to_f
      longitude = (cookies.signed[:longitude] || DEFAULT_LOCATION.second).to_f
      utc_offset = cookies.signed[:utc_offset] || default_utc_offset

      @observer = Astronoby::Observer.new(
        latitude: Astronoby::Angle.from_degrees(latitude),
        longitude: Astronoby::Angle.from_degrees(longitude),
        utc_offset: utc_offset
      )
    end
  end
end
