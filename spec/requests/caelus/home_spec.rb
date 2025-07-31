# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Caelus Home", type: :request do
  describe "GET /caelus" do
    it "returns a successful response" do
      get caelus_root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
