# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Planets", type: :request do
  describe "GET /caelus/planets/:id" do
    context "when the planet exists" do
      it "returns a successful response" do
        get caelus_planet_path(id: "jupiter")

        expect(response).to have_http_status(:ok)
        expect(response.body).to include("Jupiter")
      end
    end

    context "when the planet does not exist" do
      it "returns a 404 status" do
        get caelus_planet_path(id: "pluto")

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
