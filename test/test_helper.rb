if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter "/.gs/"
  end
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  # Los test helpers de devise para los functional test
  include Devise::TestHelpers
end

require 'capybara/rails'
require 'capybara/minitest'

Capybara.default_driver = ENV['CI'] ? :selenium_chrome_headless : :selenium_chrome

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  # include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def sign_in user
    visit '/'
    click_on 'Conectarse'
    fill_in('user_username', with: user.username)
    fill_in('user_password', with: 'password')
    click_button 'Conectar'
    assert_text 'Ingresaste correctamente'
  end
end
