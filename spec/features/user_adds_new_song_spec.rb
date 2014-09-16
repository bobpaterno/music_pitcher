feature "Add new song" do
  background do
    @user = Fabricate(:user)
    login_as(@user)
    visit songs_path
    click_button "Add Song"
    fill_in "Title", with: "Superfly"
    fill_in "Artist", with: "Curtis Mayfield"
    fill_in "Genre", with: "Soul"
    fill_in "Description", with: "Funky, 70s soul music"
  end

  scenario "user visits new song page" do
    expect(page).to have_content("New Song")
    expect(page).to have_content("Title")
    expect(page).to have_content("Artist")
    expect(page).to have_content("Genre")
    expect(page).to have_content("Description")
  end

  scenario "user adds new song" do
    attach_file 'song_audiofile', 'spec/support/data/pretty.mp3'
    expect(Song.count).to eq 0
    click_button "Create"
    expect(page.current_path).to eq songs_path
    expect(page).to have_content("Song created")
    song_count = Song.count
    expect(song_count).to eq 1
  end

  scenario "song file is not type MP3 or WAV" do
    attach_file 'song_audiofile', 'spec/support/data/invalid.php'
    click_button "Create"
    expect(Song.count).to eq 0
    expect(page).to have_content("allowed types: mp3, wav")
  end

  scenario "song file is too large" do
    attach_file 'song_audiofile', 'spec/support/data/too_large.wav'
    click_button "Create"
    expect(Song.count).to eq 0
    expect(page).to have_content("Audiofileis too big (should be at most 50 MB)")
  end
end