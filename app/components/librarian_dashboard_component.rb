# frozen_string_literal: true

class LibrarianDashboardComponent < ViewComponent::Base
  def initialize(presenter:)
    @presenter = presenter
  end
end
