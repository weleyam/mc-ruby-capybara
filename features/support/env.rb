require 'allure-cucumber'
require 'capybara'
require 'capybara/rspec'
require 'capybara/cucumber'
require 'capybara-screenshot'
require 'cucumber'
require 'rake'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'

wait_time = 60 * 5

Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    options = Selenium::WebDriver::Firefox::Options.new
    options.add_argument('--headless')
    # options.add_preference 'dom.webdriver.enabled', false
    # options.add_preference 'dom.webnotifications.enabled', false
    # options.add_preference 'dom.push.enabled', false
    # options.add_argument('--width=1366')
    # options.add_argument('--height=1000')
    options.add_argument('-private')
    options.profile = profile
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.open_timeout = wait_time
    client.read_timeout = wait_time
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: options,
      http_client: client,
    )
  end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 200
end

AllureCucumber.configure do |config|
    config.results_directory = "reports/allure-results"
    config.clean_results_directory = true
    config.logging_level = Logger::INFO
    config.logger = Logger.new($stdout, Logger::DEBUG)
    config.environment = "production"
    config.failure_exception = RSpec::Expectations::ExpectationNotMetError
end

def take_screenshot(scenario)
    scenario_name = scenario.name
    time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = 'features/support/reports/screenshot/' + time + ' - ' + scenario_name + '.png'
    Capybara.current_session.driver.save_screenshot(screenshot_path)
    image = open(screenshot_path, 'rb', &:read)
    # encoded_image = Base64.encode64(image)
    attach(image, 'image/png', 'SCREENSHOT')
end
