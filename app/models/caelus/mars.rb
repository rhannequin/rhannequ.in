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

    def self.symbol
      "♂"
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
