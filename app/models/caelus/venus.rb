# frozen_string_literal: true

module Caelus
  class Venus
    include Planetable

    def self.planet_class
      Astronoby::Venus
    end

    def self.key
      :venus
    end

    def self.symbol
      "♀"
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
