feature "Home page" do
  scenario "user is not logged in" do
    visit "/"
    expect(page).to have_content("Welcome to Music Pitcher")
  end

  scenario "user is logged in" do
    pending "implementation"
    visit "/"
    expect(page).to have_content("Publisher's Main Menu")
  end
end
