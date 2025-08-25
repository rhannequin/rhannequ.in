# frozen_string_literal: true

module Caelus
  class Uranus
    include Planetable

    def self.planet_class
      Astronoby::Uranus
    end

    def self.key
      :uranus
    end

    def initialize(observer:, time: Time.now)
      @observer = observer
      @time = time
    end
  end
end
