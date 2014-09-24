feature "user adds new pitch" do
  background do
    @user = Fabricate(:user)
    @song1= Fabricate(:song, title: "Winners")
    @song2= Fabricate(:song, title: "Windows")
    @song3= Fabricate(:song, title: "Long Road")
    @pitch= Fabricate(:pitch)
    login_as(@user)
  end

  scenario "form displays" do
    visit new_pitch_path
    expect(page).to have_content("New Pitch")
    expect(page).to have_field("pitch[pitch_to]")
    expect(page).to have_field("pitch[pitch_notes]")
    expect(page).to have_field("pitch[email]")
    expect(page).to have_field("pitch[subject]")
    expect(page).to have_field("pitch[message]")
    expect(page).to have_button("Next")
  end

  scenario "next creates new pitch and goes to select song page (step 2)" do
    visit new_pitch_path
    fill_in "Pitch to", with: "Ed Biglesworth"
    fill_in "Pitch notes", with: "Ed asked for a great song"
    fill_in "Email", with: "ed@songms.com"
    fill_in "Subject", with: "Here's the song you wanted"
    fill_in "Message", with: "Ed,\nHope you are doing well.  Check this song out.\n-Dr. Evil"
    expect(Pitch.count).to eq 1  # already created one in background
    click_button "Next"
    expect(Pitch.count).to eq 2
    expect(page.current_path).to eq song_select_pitch_path(Pitch.last)
  end

  scenario "select one song and add successfully" do
    visit song_select_pitch_path(@pitch)
    select "Winners"
    expect(SongSelection.count).to eq 0
    click_button "Add"
    expect(SongSelection.count).to eq 1
  end

  scenario "add multiple songs and save successfully" do
    pending "implementation"
    visit new_pitch_path
    fail
    fill_in("Foo", with: "Win")
  end

  scenario "there are no songs in the database" do
    pending "implementation"
    fail
  end

  scenario "email field is not filled in" do
    pending "implementation"
    fail
  end

  scenario "subject field is not filled in" do
    pending "implementation"
    fail
  end

end