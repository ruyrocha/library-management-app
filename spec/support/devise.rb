# frozen_string_literal: true

RSpec.configure do |config|
  config.include(Warden::Test::Helpers, type: :system)
  config.include(Warden::Test::Helpers, type: :request)
  config.include(Devise::Test::IntegrationHelpers, type: :system)
  config.include(Devise::Test::IntegrationHelpers, type: :request)
end
