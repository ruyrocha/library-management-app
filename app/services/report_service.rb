# frozen_string_literal: true

class ReportService
  def initialize(user:)
    @user = user
  end

  def call
    if @user.is_member?
      ::MemberDashboardPresenter.new(@user)
    elsif @user.is_librarian?
      ::LibrarianDashboardPresenter.new
    end
  end
end
