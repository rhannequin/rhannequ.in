# frozen_string_literal: true

module Caelus
  class Saturn
    include Planetable

    def self.planet_class
      Astronoby::Saturn
    end

    def self.key
      :saturn
    end

    def initialize(time: Time.now)
      @time = time
    end
  end
end
