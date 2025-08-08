# frozen_string_literal: true

module Caelus
  class Earth
    include Planetable

    def self.planet_class
      Astronoby::Earth
    end

    def self.key
      :earth
    end

    def initialize(time: Time.now)
      @time = time
    end

    def distance_from_earth
      Astronoby::Distance.zero
    end
  end
end
