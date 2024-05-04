Before do |scenario|
    # page.windows[0].maximize
end

After do |scenario|
    sleep 3
    take_screenshot(scenario)
    Capybara.current_session.driver.quit
end

at_exit do
    ReportBuilder.configure do |config|
      config.input_path = 'features/support/reports/result-cucumber.json'
      config.report_path = 'features/support/reports/test_result'
      config.report_types = [:html]
      config.report_title = "Test Result"
      config.includes_image = true
    end
    ReportBuilder.build_report
end
