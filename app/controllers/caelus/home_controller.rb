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
      @twilight_events = Astronoby::TwilightCalculator.new(
        observer: @observer,
        ephem: SPK.inpop19a
      ).event_on(Date.today)
      @next_twilight_events = Astronoby::TwilightCalculator.new(
        observer: @observer,
        ephem: SPK.inpop19a
      ).event_on(Date.tomorrow)
      @moon = Astronoby::Moon.new(
        instant: Astronoby::Instant.from_time(Time.now),
        ephem: SPK.inpop19a
      )
      moon_rts = Astronoby::RiseTransitSetCalculator.new(
        body: Astronoby::Moon,
        observer: @observer,
        ephem: SPK.inpop19a
      ).event_on(Date.today)
      @moon_rising_time = moon_rts.rising_time
      @moon_setting_time = if moon_rts.setting_time > @moon_rising_time
        moon_rts.setting_time
      else
        Astronoby::RiseTransitSetCalculator.new(
          body: Astronoby::Moon,
          observer: @observer,
          ephem: SPK.inpop19a
        ).event_on(Date.tomorrow).setting_time
      end
    end
  end
end
