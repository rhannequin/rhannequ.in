# frozen_string_literal: true

require "rails_helper"

RSpec.describe Caelus::ObserverHelper do
  include Caelus::ObserverHelper

  describe "#format_observer_coordinates" do
    context "with positive angles" do
      it "formats using N and E" do
        observer = instance_double(
          Astronoby::Observer,
          latitude: Astronoby::Angle.from_degrees(34.0567),
          longitude: Astronoby::Angle.from_degrees(118.2543)
        )

        result = format_observer_coordinates(observer)

        expect(result).to eq("34.06° N, 118.25° E")
      end
    end

    context "with negative angles" do
      it "formats using S and W" do
        observer = instance_double(
          Astronoby::Observer,
          latitude: Astronoby::Angle.from_degrees(-33.8783),
          longitude: Astronoby::Angle.from_degrees(-151.2189)
        )

        result = format_observer_coordinates(observer)

        expect(result).to eq("33.88° S, 151.22° W")
      end
    end
  end
end
