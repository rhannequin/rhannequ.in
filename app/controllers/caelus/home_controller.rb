# frozen_string_literal: true

module Caelus
  class HomeController < ApplicationController
    def index
      @observer = Astronoby::Observer.new(
        latitude: Astronoby::Angle.from_degrees(51.5074),
        longitude: Astronoby::Angle.from_degrees(-0.1278)
      )
      @planets = [
        Mercury.new(observer: @observer),
        Venus.new(observer: @observer),
        Mars.new(observer: @observer),
        Jupiter.new(observer: @observer),
        Saturn.new(observer: @observer),
        Uranus.new(observer: @observer),
        Neptune.new(observer: @observer)
      ]
      @sun = Sun.new(observer: @observer)
      @moon = Moon.new(observer: @observer)
      @twilight_events = Astronoby::TwilightCalculator.new(
        observer: @observer,
        ephem: SPK.inpop19a
      ).event_on(Date.today)
      @next_twilight_events = Astronoby::TwilightCalculator.new(
        observer: @observer,
        ephem: SPK.inpop19a
      ).event_on(Date.tomorrow)
    end
  end
end
