# frozen_string_literal: true

require "rails_helper"

RSpec.describe Caelus::CookieConsentController, type: :request do
  describe "POST /caelus/cookie_consent" do
    it "sets the cookie consent cookie" do
      post caelus_cookie_consent_path
      jar = response.request.cookie_jar

      expect(jar.signed[:cookie_consent]).to eq("true")
    end

    it "redirects to the root path after creating" do
      post caelus_cookie_consent_path

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(caelus_root_path)
    end
  end

  describe "DELETE /caelus/cookie_consent" do
    it "clears the observer's location cookies" do
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

      expect(jar.signed[:latitude]).to eq("34.0567")
      expect(jar.signed[:longitude]).to eq("-118.2543")
      expect(jar.signed[:utc_offset]).to eq("-08:00")

      delete caelus_cookie_consent_path
      jar = response.request.cookie_jar

      expect(jar.signed[:latitude]).to be_nil
      expect(jar.signed[:longitude]).to be_nil
      expect(jar.signed[:utc_offset]).to be_nil
    end

    it "redirects to the root path after deleting" do
      delete caelus_cookie_consent_path

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(caelus_root_path)
    end
  end
end
