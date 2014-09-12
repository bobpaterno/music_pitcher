feature "Songs Index Page" do
  scenario "user is not logged in" do
    visit songs_path
    expect(page).to have_content("Welcome to Music Pitcher")
  end

  scenario "user is logged in and visits songs index page" do
    pending "Implementation"
    user = Fabricate(:user)
    login_as(user)
    visit song_path
    expect(page).to have_content("Song List")
    expect(page).to have_content("Create Song")
  end
end
