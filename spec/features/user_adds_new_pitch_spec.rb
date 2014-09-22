feature "user adds new pitch" do
  background do
    @user = Fabricate(:user)
    @song1= Fabricate(:song, title: "Winners")
    @song2= Fabricate(:song, title: "Losers")
    @song3= Fabricate(:song, title: "The Mediocre")
    login_as(@user)
  end

  scenario "everything goes well" do
    visit new_pitch_path
    expect(page).to have_content("New Pitch")
    expect(page).to have_field("pitch[pitch_to]")
    expect(page).to have_field("pitch[pitch_notes]")
    expect(page).to have_field("pitch[email]")
    expect(page).to have_field("pitch[subject]")
    expect(page).to have_field("pitch[message]")
    expect(page).to have_button("Send Pitch")
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