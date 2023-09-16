Given('I am on the homepage') do
    visit 'https://automationexercise.com/'
end

When('I click  sign in') do
    # click button sign in
    find(:xpath, "//a[@href='/login']").click
    # make sure we are on the correct page
    expect(URI.parse(current_url)).to have_content("/login")
    find(:xpath, "//h2[text()='Login to your account']").should be_visible
end

When('I fill my credentials') do
    # input username
    find(:xpath, "//input[@data-qa='login-email']").set("wele.testing@gmail.com")
    # input password
    fill_in 'password', with: 'abc123'
    # click button login
    click_on "Login"
end

Then('I should be logged in') do
    find(:xpath, "//*[text()=' Logged in as ']").should be_visible
end

When('I enter username as {string}') do |username|
    find(:xpath, "//input[@data-qa='login-email']").set(username)
end

When('I enter password as {string}') do |password|
    fill_in 'password', with: password
end

When('I click button login') do
    click_on "Login"
end