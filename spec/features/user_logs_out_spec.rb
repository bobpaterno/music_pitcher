feature "Logout" do
  background do
    Fabricate(:user, username: "user1")
    visit new_user_session_path
    fill_in "Username", with: "user1"
    fill_in "Password", with: "password1"
    click_button "Login"
  end

  scenario "logged in user is redirected to menu" do
    visit "/"
    expect(page.current_path).to eq menu_path
    expect(page).to have_content("Main Menu")
    expect(page).to have_content("Welcome to Music Pitcher")
  end

  scenario "user logs out" do
    visit "/"
    click_on "Logout"
    expect(page).to have_content("Sign In")
    expect(page).to have_field("user[username]")
    expect(page).to have_field("user[password]")
  end

end