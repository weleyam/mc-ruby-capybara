
class LoginPage < SitePrism::Page
  element :txt_username, :xpath, "/html/body/div[2]/div/div/div[2]/div/form/div/div[2]/div[1]/div/div[1]/div/div/input"
  element :txt_password, :xpath, "//input[@data-test-id='CT_component_password_input']"
  element :btn_sign_in, :xpath, "//button[@data-test-id='CT_component_login_submit']"

  def input_username(string)
    txt_username.set(string)
  end

  def input_password(string)
    txt_password.set(string)
  end

  def click_btn_sign_in
    btn_sign_in.click
  end
end
