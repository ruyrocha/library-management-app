# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    render(plain: ":)")
  end
end
