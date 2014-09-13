feature "Songs Index Page" do
  scenario "user is not logged in" do
    visit songs_path
    expect(page).to have_content("Welcome to Music Pitcher")
  end

  scenario "there are no songs in the database" do
    user = Fabricate(:user)
    login_as(user)
    visit songs_path
    expect(Song.count).to eq 0
    expect(page).to have_content("There are no songs in the database")
  end

  scenario "user is logged in and visits songs index page" do
    Fabricate(:song)
    Fabricate(:song)
    user = Fabricate(:user)
    login_as(user)
    visit songs_path
    expect(Song.count).to eq 2
    expect(page).to have_content("Song List")
    expect(page).to have_content("Create Song")
    expect(page).to have_content("Title")
    expect(page).to have_content("Artist")
    expect(page).to have_content("Genre")
    expect(page).to have_link("Song0")
    expect(page).to have_content("Artist0")
    expect(page).to have_content("Genre0")
    expect(page).to have_link("Song1")
    expect(page).to have_content("Artist1")
    expect(page).to have_content("Genre1")
    expect(page).not_to have_content("There are no songs in the database")
  end

end