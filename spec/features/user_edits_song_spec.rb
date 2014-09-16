feature "user edits song" do
  background do
    @user = Fabricate(:user)
    @song = Fabricate(:song)
    login_as(@user)
    visit songs_path
    click_on "#{@song.title}"
    click_on "Edit Song"
  end

  scenario "user edits title and description" do
    original_title = @song.title
    original_desc  = @song.description
    fill_in "Title", with: "Altered Title"
    fill_in "Description", with: "Altered description"
    click_button "Update"
    expect(Song.last.title).not_to eq original_title
    expect(Song.last.description).not_to eq original_desc
    expect(Song.last.title).to eq "Altered Title"
  end

  scenario "user edits genre and artist" do
    original_artist = @song.artist
    original_genre  = @song.genre
    fill_in "Artist", with: "Altered Artist"
    fill_in "Genre", with: "Altered Genre"
    click_button "Update"
    expect(Song.last.artist).not_to eq original_artist
    expect(Song.last.genre).not_to eq original_genre
    expect(Song.last.genre).to eq "Altered Genre"
  end

  scenario "user leaves a required field blank" do
    fill_in "Title", with: "Altered Title"
    fill_in "Artist", with: ""
    click_button "Update"
    expect(page.current_path).to eq song_path(@song)
    expect(Song.last.title).not_to eq "Altered Title"
  end

  scenario "user tries to edit song file" do
    attach_file 'song_audiofile', 'spec/support/data/timber.wav'
    fill_in "Title", with: "Timber"
    click_button "Update"
    expect(Song.last.title).to eq "Timber"
  end

end