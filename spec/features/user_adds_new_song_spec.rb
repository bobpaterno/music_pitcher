feature "Add new song" do
  background do
    @user = Fabricate(:user)
  end

  scenario "user visits new song page" do
    login_as(@user)
    visit songs_path
    click_button "Add Song"
    expect(page).to have_content("New Song")
    expect(page).to have_content("Title")
    expect(page).to have_content("Artist")
    expect(page).to have_content("Genre")
    expect(page).to have_content("Description")
  end

  scenario "user adds new song" do
    login_as(@user)
    visit songs_path
    click_button "Add Song"
    fill_in "Title", with: "Superfly"
    fill_in "Artist", with: "Curtis Mayfield"
    fill_in "Genre", with: "Soul"
    fill_in "Description", with: "Funky, 70s soul music"
    expect(Song.count).to eq 0
    click_button "Create"
    expect(page.current_path).to eq songs_path
    expect(page).to have_content("Song created")
    song_count = Song.count
    expect(song_count).to eq 1
  end
end