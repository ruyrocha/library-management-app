# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    return can([:read, :create, :update, :destroy], Book) if user.is_librarian?

    can([:read], Book) if user.is_member?
  end
end
