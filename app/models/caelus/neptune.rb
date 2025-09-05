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

    def self.symbol
      "♆"
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
