# frozen_string_literal: true

require "rails_helper"

RSpec.describe Caelus::MoonPhaseSvg, type: :model do
  describe "#draw" do
    context "when the moon is a waxing crescent" do
      it "generates a waxing crescent SVG" do
        observer = double
        time = Time.utc(2025, 8, 28)
        moon = Caelus::Moon.new(observer: observer, time: time)
        moon_phase_svg = Caelus::MoonPhaseSvg.new(moon)

        output = moon_phase_svg.draw.gsub(/\s+/, " ").strip

        expected = <<SVG
          <svg
            width="400"
            height="400"
            viewBox="0 0 400 400"
            xmlns="http://www.w3.org/2000/svg"
          >
            <defs>
              <clipPath>
                <circle cx="200.0" cy="200.0" r="179.5"/>
              </clipPath>
            </defs>
            <circle
              cx="200.0"
              cy="200.0"
              r="179.5"
              fill="#f0f0e0"
              stroke="#444"
              stroke-width="1"
            />
            <path
              d="M 200.0 20.5 A 179.5 179.5 0 0 0 200.0 379.5 A 104.20347011266489 179.5 0 1 0 200.0 20.5"
              fill="#222"
            />
         </svg>
SVG
          .gsub(/\s+/, " ")
          .strip

        expect(output).to eq(expected)
      end
    end

    context "when the moon is full" do
      it "generates a full moon SVG" do
        observer = double
        time = Time.utc(2025, 9, 7, 18, 8)
        moon = Caelus::Moon.new(observer: observer, time: time)
        moon_phase_svg = Caelus::MoonPhaseSvg.new(moon)

        output = moon_phase_svg.draw.gsub(/\s+/, " ").strip

        expected = <<SVG
          <svg
            width="400"
            height="400"
            viewBox="0 0 400 400"
            xmlns="http://www.w3.org/2000/svg"
          >
            <defs>
              <clipPath>
                <circle
                  cx="200.0"
                  cy="200.0"
                  r="179.5"/>
              </clipPath>
            </defs>
            <circle
              cx="200.0"
              cy="200.0"
              r="179.5"
              fill="#f0f0e0"
              stroke="#444"
              stroke-width="1"
            />
          </svg>
SVG
          .gsub(/\s+/, " ")
          .strip

        expect(output).to eq(expected)
      end
    end

    context "when the moon is new" do
      it "generates a new moon SVG" do
        observer = double
        time = Time.utc(2025, 9, 21, 19, 54)
        moon = Caelus::Moon.new(observer: observer, time: time)
        moon_phase_svg = Caelus::MoonPhaseSvg.new(moon)

        output = moon_phase_svg.draw.gsub(/\s+/, " ").strip

        expected = <<SVG
          <svg
            width="400"
            height="400"
            viewBox="0 0 400 400"
            xmlns="http://www.w3.org/2000/svg"
          >
            <defs>
              <clipPath>
                <circle
                  cx="200.0"
                  cy="200.0"
                  r="179.5"/>
              </clipPath>
            </defs>
            <circle
              cx="200.0"
              cy="200.0"
              r="179.5"
              fill="#f0f0e0"
              stroke="#444"
              stroke-width="1"
            />
            <path
              d="M 20.5,200.0 a 179.5,179.5 0 1,0 359.0,0 a 179.5,179.5 0 1,0 -359.0,0"
              fill="#222"
            />
          </svg>
SVG
          .gsub(/\s+/, " ")
          .strip

        expect(output).to eq(expected)
      end
    end

    context "when the moon is wanning gibbous" do
      it "generates a wanning gibbous SVG" do
        observer = double
        time = Time.utc(2025, 9, 10)
        moon = Caelus::Moon.new(observer: observer, time: time)
        moon_phase_svg = Caelus::MoonPhaseSvg.new(moon)

        output = moon_phase_svg.draw.gsub(/\s+/, " ").strip

        expected = <<SVG
          <svg
            width="400"
            height="400"
            viewBox="0 0 400 400"
            xmlns="http://www.w3.org/2000/svg"
          >
            <defs>
              <clipPath>
                <circle cx="200.0" cy="200.0" r="179.5"/>
              </clipPath>
            </defs>
            <circle
              cx="200.0"
              cy="200.0"
              r="179.5"
              fill="#f0f0e0"
              stroke="#444"
              stroke-width="1"
            />
            <path
              d="M 200.0 20.5 A 179.5 179.5 0 0 1 200.0 379.5 A 155.02530660294195 179.5 0 0 0 200.0 20.5"
              fill="#222"
            />
         </svg>
SVG
          .gsub(/\s+/, " ")
          .strip

        expect(output).to eq(expected)
      end
    end
  end
end
