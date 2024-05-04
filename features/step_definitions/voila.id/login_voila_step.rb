Given('user access voila.id') do
  # pending # Write code here that turns the phrase above into concrete actions
  @landing_page = LandingPage.new
  @landing_page.load
end

When('user clicks sign in button on the landing page') do
  @landing_page.wait_until_btn_sign_in_visible
  @landing_page.click_btn_sign_in
end

Then('user will redirected to login page') do
  visit "https://voila.id/account/login"
  expect(page).to have_current_path("/account/login")
end

When('user enters username as {string} on the login page') do |username|
  @login_page = LoginPage.new
  @login_page.input_username(username)
end

When('user enters password as {string} on the login page') do |password|
  @login_page.input_password(password)
end

When('user clicks button sign on on the login page') do
  @login_page.click_btn_sign_in
end

Then('user success login') do
  assert_current_path("https://voila.id/", wait: 5)
end

Given('user access google') do
  visit "https://www.google.com"
end
