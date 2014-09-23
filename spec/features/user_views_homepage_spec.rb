feature "Home page" do
  scenario "user is not logged in" do
    visit "/"
    expect(page).to have_content("Welcome to Music Pitcher")
    expect(page).to have_button("Login")
  end
end
