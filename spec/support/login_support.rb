module LoginSupport
  def log_in_as(user)
    visit root_path
    click_link "ホスト企業 | 新規登録orログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end

  def log_in_as(call_center_user)
    visit root_path
    click_link "コールセンター | 新規登録orログイン"
    fill_in "メールアドレス", with: call_center_user.email
    fill_in "パスワード", with: call_center_user.password
    click_button "ログイン"
  end

  def sign_in_as(user)
    post user_session_path, params: { session: { email: user.email, password: user.password } }
  end

  def sign_in_as(call_center_user)
    post call_center_user_session_path, params: { session: { email: call_center_user.email, password: call_center_user.password } }
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
