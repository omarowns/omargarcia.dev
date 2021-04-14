ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'faker'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def login(user = create(:user))
    if self.class.is_a?(ApplicationSystemTestCase)
      login_as(user, scope: :user)
    else
      sign_in(user)
    end
  end
end
