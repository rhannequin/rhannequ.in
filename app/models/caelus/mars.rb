# frozen_string_literal: true

module Caelus
  class Mars
    include Planetable

    def self.planet_class
      Astronoby::Mars
    end

    def self.key
      :mars
    end

    def initialize(time: Time.now)
      @time = time
    end
  end
end
