# frozen_string_literal: true

module Caelus
  class ApplicationController < ActionController::Base
    DEFAULT_LOCATION = [51.5072, -0.1276] # London

    before_action :set_observer

    layout "caelus"

    private

    def set_observer
      latitude = (cookies.signed[:latitude] || DEFAULT_LOCATION.first).to_f
      longitude = (cookies.signed[:longitude] || DEFAULT_LOCATION.second).to_f

      @observer = Astronoby::Observer.new(
        latitude: Astronoby::Angle.from_degrees(latitude),
        longitude: Astronoby::Angle.from_degrees(longitude)
      )
    end
  end
end
