# frozen_string_literal: true

module Caelus
  class HomeController < ApplicationController
    def index
      ephem = SPK.inpop19a
      time = Time.now
      instant = Astronoby::Instant.from_time(time)
      @sun = Astronoby::Sun.new(instant: instant, ephem: ephem)
      @mercury = Astronoby::Mercury.new(instant: instant, ephem: ephem)
      @venus = Astronoby::Venus.new(instant: instant, ephem: ephem)
      @earth = Astronoby::Earth.new(instant: instant, ephem: ephem)
      @mars = Astronoby::Mars.new(instant: instant, ephem: ephem)
      @jupiter = Astronoby::Jupiter.new(instant: instant, ephem: ephem)
      @saturn = Astronoby::Saturn.new(instant: instant, ephem: ephem)
      @uranus = Astronoby::Uranus.new(instant: instant, ephem: ephem)
      @neptune = Astronoby::Neptune.new(instant: instant, ephem: ephem)
    end
  end
end
