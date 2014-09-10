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
    expect(page).to have_content("Logout")
  end

  scenario "user logs out" do
    visit "/"
    click_on "Logout"
    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end

end