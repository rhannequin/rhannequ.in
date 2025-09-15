# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Moon", type: :request do
  describe "GET /caelus/moon" do
    it "returns a successful response" do
      travel_to Time.utc(2025, 8, 30) do
        get caelus_moon_path

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
