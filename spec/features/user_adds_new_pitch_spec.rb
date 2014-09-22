feature "user adds new pitch" do
  background do
    @user = Fabricate(:user)
    @song1= Fabricate(:song, title: "Winners")
    @song2= Fabricate(:song, title: "Windows")
    @song3= Fabricate(:song, title: "Winding Roads")
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
    expect(page).to have_button("Send Pitch")
  end

  scenario "songs autocomplete works" do
    visit new_pitch_path
    fill_in()
  end

  scenario "add one song and save successfully" do
    visit new_pitch_path
    fill_in("Foo", with: "Win")
    click "Winners"
    click_button "Send Pitch"
  end

  scenario "add multiple songs and save successfully" do
    visit new_pitch_path
    pending "implementation"
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