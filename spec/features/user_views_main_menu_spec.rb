feature "Main Menu Page" do
  scenario "user is not logged in" do
    visit menu_path
    expect(page).to have_content("Welcome to Music Pitcher")
  end

  scenario "user is logged in" do
    user = Fabricate(:user)
    login_as(user)
    visit menu_path
    expect(page).to have_content("Main Menu")
    expect(page).to have_link("Songs")
    expect(page).to have_link("Pitches")
  end
end
