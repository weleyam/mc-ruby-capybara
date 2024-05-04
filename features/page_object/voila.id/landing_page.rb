
class LandingPage < SitePrism::Page
  set_url("https://voila.id/")

  element :btn_sign_in, :xpath, "//*[@data-test-id='CT-SignIn-Btn']"

  def click_btn_sign_in
    btn_sign_in.click
  end
end
