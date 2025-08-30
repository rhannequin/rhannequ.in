# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Location", type: :request do
  describe "PATCH /caelus/location" do
    context "when cookie consent is given" do
      it "updates the observer's location" do
        post caelus_cookie_consent_path

        patch(
          caelus_location_path,
          params: {
            latitude: "34.0567",
            longitude: "-118.2543",
            utc_offset: "-08:00"
          }
        )
        jar = response.request.cookie_jar

        latitude = jar.signed[:latitude]
        longitude = jar.signed[:longitude]
        utc_offset = jar.signed[:utc_offset]
        expect(latitude).to eq("34.0567")
        expect(longitude).to eq("-118.2543")
        expect(utc_offset).to eq("-08:00")
      end

      it "redirects to the root path after updating" do
        post caelus_cookie_consent_path

        patch(
          caelus_location_path,
          params: {
            latitude: "34.0567",
            longitude: "-118.2543",
            utc_offset: "-08:00"
          }
        )

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(caelus_root_path)
      end

      it "validates UTC offset format" do
        post caelus_cookie_consent_path
        valid_offsets = %w[+00:00 +05:30 -08:00 +12:00 -12:00 +03:15 -06:30]

        valid_offsets.each do |offset|
          patch(
            caelus_location_path,
            params: {
              latitude: "34.0567",
              longitude: "-118.2543",
              utc_offset: offset
            }
          )

          expect(response).to have_http_status(:found)
          expect(response.request.cookie_jar.signed[:utc_offset]).to eq(offset)
        end
      end

      it "rejects invalid UTC offset formats" do
        post caelus_cookie_consent_path
        invalid_offsets = %w[13:00 +13:00 -13:00 +00:10 -00:20 00:00 invalid]

        invalid_offsets.each do |offset|
          patch(
            caelus_location_path,
            params: {
              latitude: "34.0567",
              longitude: "-118.2543",
              utc_offset: offset
            }
          )

          expect(response).to have_http_status(:found)
          expect(response.request.cookie_jar.signed[:utc_offset]).to be_nil
        end
      end

      it "works without UTC offset parameter" do
        post caelus_cookie_consent_path

        patch(
          caelus_location_path,
          params: {
            latitude: "34.0567",
            longitude: "-118.2543"
          }
        )
        jar = response.request.cookie_jar

        expect(response).to have_http_status(:found)
        expect(jar.signed[:latitude]).to eq("34.0567")
        expect(jar.signed[:longitude]).to eq("-118.2543")
        expect(jar.signed[:utc_offset]).to be_nil
        expect(response).to redirect_to(caelus_root_path)
      end
    end
  end
end
