feature "Login page" do
  background do
    Fabricate(:user, username: "user1")
  end

  scenario "user sees login page" do
    visit "/"
    click_on "Login"
    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_content("Sign In")
    expect(page).to have_field("user[username]")
    expect(page).to have_field("user[password]")
  end

  scenario "user logs in with correct credentials" do
    visit new_user_session_path
    fill_in "Username", with: "user1"
    fill_in "Password", with: "password1"
    click_button "Login"
  end

  scenario "user logs in with incorrect username" do
    visit new_user_session_path
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password1"
    click_button "Login"
    expect(page).to have_content("We could not sign you in. Please check your sign in information below.")
  end

  scenario "user logs in with incorrect password" do
    visit new_user_session_path
    fill_in "Username", with: "user1"
    fill_in "Password", with: "wrong"
    click_button "Login"
    expect(page).to have_content("We could not sign you in. Please check your sign in information below.")
  end

  scenario "user leaves Username blank" do
    visit new_user_session_path
    fill_in "Password", with: "wrong"
    click_button "Login"
    expect(page).to have_content("We could not sign you in. Please check your sign in information below.")
  end

  scenario "user leaves Password blank" do
    visit new_user_session_path
    fill_in "Username", with: "user1"
    click_button "Login"
    expect(page).to have_content("We could not sign you in. Please check your sign in information below.")
  end

end
