# frozen_string_literal: true

require "rails_helper"

RSpec.describe Caelus::DateTimeHelper do
  include Caelus::DateTimeHelper

  describe "#nillable_datetime" do
    context "when datetime is nil" do
      it "returns the empty set symbol" do
        expect(nillable_datetime(nil)).to eq("∅")
      end
    end

    context "when datetime is present" do
      it "formats the datetime using the default format" do
        datetime = Time.zone.parse("2024-06-15 14:30:00")

        expect(nillable_datetime(datetime))
          .to eq("Sat, 15 Jun 2024 14:30:00 +0000")
      end

      it "formats the datetime using a custom format" do
        datetime = Time.zone.parse("2024-06-15 14:30:00")

        expect(nillable_datetime(datetime, format: :short))
          .to eq("15 Jun 14:30")
      end
    end
  end
end
