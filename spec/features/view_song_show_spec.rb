feature "Song Show Page" do
  background do
    @user = Fabricate(:user)
    @song1 = Fabricate(:song)
  end

  scenario "user is not logged in" do
    visit song_path(@song1)
    expect(page).to have_content("Welcome to Music Pitcher")
  end

  scenario "user sees details about song" do
    @song2 = Fabricate(:song, title: "Song2", description: "Awesome song!")
    login_as(@user)
    visit song_path(@song2)
    expect(page).to have_content("Song2")
    expect(page).to have_content("Awesome song!")
    expect(page).to have_button("Edit Song")
    expect(page).to have_button("Delete Song")
  end

  scenario "user attempts to see non-existing song" do
    login_as(@user)
    visit song_path(2000)
    expect(page).to have_content("Song could not be found")
  end
end