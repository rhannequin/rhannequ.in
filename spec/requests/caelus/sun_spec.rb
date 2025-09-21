# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Sun", type: :request do
  describe "GET /caelus/sun" do
    it "returns a successful response" do
      travel_to Time.utc(2025, 8, 30) do
        get caelus_sun_path

        expect(response).to have_http_status(:ok)
      end
    end

    context "using an extreme latitude" do
      it "returns a successful response" do
        travel_to Time.utc(2025, 12, 21) do
          post caelus_cookie_consent_path
          patch(
            caelus_location_path,
            params: {
              latitude: "89",
              longitude: "0"
            }
          )

          get caelus_sun_path

          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
