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

    def initialize(time: Time.now)
      @time = time
    end
  end
end
