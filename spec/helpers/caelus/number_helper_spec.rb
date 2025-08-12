# frozen_string_literal: true

require "rails_helper"

RSpec.describe Caelus::NumberHelper do
  include Caelus::NumberHelper

  describe "#format_number" do
    it "formats a number with default precision and no unit" do
      expect(format_number(123.456)).to eq("123.46")
    end

    it "formats a number with specified precision" do
      expect(format_number(123.456, precision: 3)).to eq("123.456")
    end

    it "formats a number with trailing zeros removed" do
      expect(format_number(123.4500)).to eq("123.45")
    end

    it "formats a number with a supported unit" do
      expect(format_number(123.456, unit: :au)).to eq("123.46 AU")
    end

    it "formats a number with a unsupported unit" do
      expect(format_number(123.456, unit: :kg)).to eq("123.46")
    end

    it "handles zero correctly" do
      expect(format_number(0)).to eq("0.00")
      expect(format_number(0, precision: 3)).to eq("0.000")
      expect(format_number(0, unit: :au)).to eq("0.00 AU")
    end
  end
end
