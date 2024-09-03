# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Dashboard", type: :request) do
  let(:user) { create(:user) }

  describe "GET /index" do
    context "when authenticated" do
      it "returns the response body" do
        sign_in(user)

        get root_url

        expect(response).to(have_http_status(:ok))
      end
    end

    context "while not authenticated" do
      it "redirects to sign in page" do
        get root_url

        expect(response).to(have_http_status(:found))
        expect(response.location).to(eq(new_user_session_url))
      end
    end
  end
end
