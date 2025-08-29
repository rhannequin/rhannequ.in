# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Location", type: :request do
  describe "PATCH /caelus/location" do
    it "updates the observer's location" do
      patch caelus_location_path,
        params: {latitude: "34.0567", longitude: "-118.2543"}
      jar = response.request.cookie_jar

      latitude = jar.signed[:latitude]
      longitude = jar.signed[:longitude]
      expect(latitude).to eq("34.0567")
      expect(longitude).to eq("-118.2543")
    end

    it "redirects to the root path after updating" do
      patch caelus_location_path,
        params: {latitude: "34.0567", longitude: "-118.2543"}

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(caelus_root_path)
    end
  end
end
