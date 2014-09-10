feature "Home page" do
  scenario "user is not logged in" do
    visit "/"
    expect(page).to have_content("Welcome to Music Pitcher")
    expect(page).to have_link("Login")
  end

  scenario "user is logged in" do
    pending "implementation"
    visit "/"
    expect(page).to have_content("Music Pitcher Main Menu")
  end
end
