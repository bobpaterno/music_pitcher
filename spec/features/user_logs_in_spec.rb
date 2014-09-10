feature "Login page" do
  scenario "user sees login page" do
    visit "/"
    click_on "Login"
    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_content("Please Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end

  scenario "user logs in with correct credentials" do
  end

  scenario "user logs in with incorrect credentials" do
  end

  scenario "user leaves Username blank" do
  end

  scenario "user leaves Password blank" do
  end

  scenario "user leaves Username and Password blank" do
  end
end
