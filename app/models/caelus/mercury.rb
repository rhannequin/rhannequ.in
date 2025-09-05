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

    def self.symbol
      "☿"
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
