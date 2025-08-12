# frozen_string_literal: true

module Caelus
  module Planetable
    extend ActiveSupport::Concern

    class_methods do
      def planet_class
        raise NotImplementedError,
          "You must implement the .planet_class class method in #{name}"
      end

      def key
        raise NotImplementedError,
          "You must implement the .key class method in #{name}"
      end

      def planet_name
        I18n.t("caelus.models.planets.#{key}.name")
      end
    end

    included do
      delegate :constellation, to: :planet

      def distance_from_earth
        @distance_from_earth ||= planet.astrometric.distance
      end

      def magnitude
        @magnitude ||= planet.apparent_magnitude.round(2)
      end

      def illuminated_percentage
        @illuminated_percentage ||= planet.illuminated_fraction.round(3) * 100
      end

      def rts(observer:)
        @rts ||= Astronoby::RiseTransitSetCalculator.new(
          body: self.class.planet_class,
          observer: observer,
          ephem: SPK.inpop19a
        )
      end

      private

      def planet
        @planet ||= self.class.planet_class.new(
          ephem: SPK.inpop19a,
          instant: Astronoby::Instant.from_time(@time)
        )
      end
    end
  end
end
