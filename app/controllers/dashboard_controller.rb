# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @presenter = ::ReportService.new(user: current_user).call
  end
end
