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

    def self.symbol
      "♃"
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
