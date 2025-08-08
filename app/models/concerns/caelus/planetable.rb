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
