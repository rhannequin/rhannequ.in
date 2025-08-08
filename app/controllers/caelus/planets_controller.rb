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
      @planet = planet_class.new
    end

    private

    def planet_class
      SUPPORTED_PLANETS.fetch(params[:id].to_sym) do
        raise ActionController::RoutingError, "Planet not found"
      end
    end
  end
end
