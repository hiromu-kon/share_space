module LoginSupport
  def log_in_as(user)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end

  def sign_in_as(user)
    post user_session_path, params: { session: { email: user.email, password: user.password } }
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
