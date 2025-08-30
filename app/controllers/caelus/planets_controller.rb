# frozen_string_literal: true

module Caelus
  class PlanetsController < ApplicationController
    SUPPORTED_PLANETS = {
      mercury: Mercury,
      venus: Venus,
      mars: Mars,
      jupiter: Jupiter,
      saturn: Saturn,
      uranus: Uranus,
      neptune: Neptune
    }.freeze
    def show
      observer = Astronoby::Observer.new(
        latitude: Astronoby::Angle.from_degrees(51.5074),
        longitude: Astronoby::Angle.from_degrees(-0.1278)
      )
      @planet = planet_class.new(observer: observer)
    end

    private

    def planet_class
      SUPPORTED_PLANETS.fetch(params[:id].to_sym) do
        raise ActionController::RoutingError, "Planet not found"
      end
    end
  end
end
