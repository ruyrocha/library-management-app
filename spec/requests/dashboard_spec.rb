# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Dashboard", type: :request) do
  describe "GET /index" do
    it "returns the response body" do
      get root_url

      expect(response).to(have_http_status(:ok))
    end
  end
end
