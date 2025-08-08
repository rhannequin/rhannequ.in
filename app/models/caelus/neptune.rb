# frozen_string_literal: true

module Caelus
  class Neptune
    include Planetable

    def self.planet_class
      Astronoby::Neptune
    end

    def self.key
      :neptune
    end

    def initialize(time: Time.now)
      @time = time
    end
  end
end
