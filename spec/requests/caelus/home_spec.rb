# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Home", type: :request do
  describe "GET /caelus" do
    it "returns a successful response" do
      travel_to Time.utc(2025, 8, 30) do
        get caelus_root_path

        expect(response).to have_http_status(:ok)
      end
    end

    context "with a very high latitude location" do
      it "handles edge cases gracefully a returns a successful response" do
        travel_to Time.utc(2025, 8, 30) do
          post caelus_cookie_consent_path
          patch caelus_location_path,
            params: {latitude: "80.0", longitude: "0.0"}

          get caelus_root_path

          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
