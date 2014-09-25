feature "user views public pitch" do
  background do
    @user = Fabricate(:user)
    @song = Fabricate(:song)
  end

  scenario "pitch exists" do
    login_as(@user)
    visit new_pitch_path
    fill_in "Pitch to", with: "Ed Biglesworth"
    fill_in "Pitch notes", with: "Ed asked for a great song"
    fill_in "Email", with: "ed@songms.com"
    fill_in "Subject", with: "Here's the song you wanted"
    fill_in "Message", with: "Ed,\nHope you are doing well.  Check this song out.\n-Dr. Evil"
    click_button "Next"
    select "#{@song.title}"
    click_button "Add"
    @pitch = Pitch.last
    expect(@pitch.songs.first.title).to eq "#{@song.title}"
    visit public_pitch_path(@pitch)
    # expect(Pitch.find_by_id(params[:id]).id).to eq @pitch.id
    expect(page).to_not have_content("Sorry, this pitch is not available")
    expect(page).to have_content("Thanks for listening")
  end

  scenario "pitch does not exist" do
    pending "Implementation"
    fail
  end
end