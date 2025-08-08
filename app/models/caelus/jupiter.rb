# frozen_string_literal: true

module Caelus
  class Jupiter
    include Planetable

    def self.planet_class
      Astronoby::Jupiter
    end

    def self.key
      :jupiter
    end

    def initialize(time: Time.now)
      @time = time
    end
  end
end
