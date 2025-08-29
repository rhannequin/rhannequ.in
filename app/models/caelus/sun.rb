# frozen_string_literal: true

module Caelus
  class Sun
    include Planetable

    def self.planet_class
      Astronoby::Sun
    end

    def self.key
      :sun
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
