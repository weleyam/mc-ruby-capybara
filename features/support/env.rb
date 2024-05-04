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

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox, timeout: 30)
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 30
end

def take_screenshot(scenario)
    scenario_name = scenario.name
    time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = 'features/support/reports/screenshot/' + time + ' - ' + scenario_name + '.png'
    Capybara.current_session.driver.save_screenshot(screenshot_path)
    image = open(screenshot_path, 'rb', &:read)
    encoded_image = Base64.encode64(image)
    attach(encoded_image, 'image/png;base64', 'SCREENSHOT')
end
