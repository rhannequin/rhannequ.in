# frozen_string_literal: true

module Caelus
  class Mercury
    include Planetable

    def self.planet_class
      Astronoby::Mercury
    end

    def self.key
      :mercury
    end

    def initialize(time: Time.now)
      @time = time
    end
  end
end
