# frozen_string_literal: true

module Caelus
  class HomeController < ApplicationController
    def index
      @planets = [
        Mercury.new,
        Venus.new,
        Mars.new,
        Jupiter.new,
        Saturn.new,
        Uranus.new,
        Neptune.new
      ]
      @observer = Astronoby::Observer.new(
        latitude: Astronoby::Angle.from_degrees(51.5074),
        longitude: Astronoby::Angle.from_degrees(-0.1278)
      )
    end
  end
end
