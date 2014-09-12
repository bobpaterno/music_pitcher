def login_as(user)
  if Capybara.current_driver.in? [:webkit, :poltergeist]
    visit '/'
    click_link "Sign In"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password1"
    click_button "Sign In"
 else
    page.driver.follow(:post, user_session_url, { user: { username: user.username, password: "password1"} })
 end
end