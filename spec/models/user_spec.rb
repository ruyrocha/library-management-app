# frozen_string_literal: true

require "rails_helper"

RSpec.describe(User, type: :model) do
  it "assigns `:member` as default role for new users" do
    user = create(:user)

    expect(user.is_member?).to(be_truthy)
  end
end
