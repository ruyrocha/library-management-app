# frozen_string_literal: true

require "rails_helper"

RSpec.describe(User, type: :model) do
  it "assigns `:member` as default role for new users" do
    user = create(:user)

    expect(user.is_member?).to(be_truthy)
  end

  describe "abilities & roles" do
    it "allows a user with `:member` role to read Book" do
      user = create(:user)

      expect(user.is_member?).to(be_truthy)
      expect(user.can?(:read, Book)).to(be_truthy)
    end

    it "allows a user with `:librarian` role to read a Book" do
      user = create(:user, :with_librarian_role)

      expect(user.is_librarian?).to(be_truthy)
      expect(user.can?(:read, Book)).to(be_truthy)
    end

    it "allows a user with `:librarian` role to create a Book" do
      user = create(:user, :with_librarian_role)

      expect(user.is_librarian?).to(be_truthy)
      expect(user.can?(:create, Book)).to(be_truthy)
    end

    it "allows a user with `:librarian` role to update a Book" do
      user = create(:user, :with_librarian_role)

      expect(user.is_member?).to(be_truthy)
      expect(user.can?(:update, Book)).to(be_truthy)
    end

    it "allows a user with `:librarian` role to destroy a Book" do
      user = create(:user, :with_librarian_role)

      expect(user.is_librarian?).to(be_truthy)
      expect(user.can?(:destroy, Book)).to(be_truthy)
    end
  end
end
