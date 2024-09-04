# frozen_string_literal: true

class MemberDashboardComponent < ViewComponent::Base
  def initialize(presenter:)
    @presenter = presenter
  end
end
