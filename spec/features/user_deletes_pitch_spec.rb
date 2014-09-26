# # User deletes a pitch from show page
# As a user
# In order to maintain a useful index of pitches
# I want to be able to delete pitches

# Usage
# * User navigates to pitch index
# * User clicks on pitch ID or "Details" of a specific pitch
# * User clicks "Delete" button

# Acceptance Criteria
# * User must be logged in
# * After "Delete" button is pressed, record is deleted

require 'pry'

feature "user deletes pitch" do
  background do
    @user = Fabricate(:user)
    @pitch1 = Fabricate(:pitch)
    @pitch2 = Fabricate(:pitch)
  end

  scenario "from show page" do
    login_as(@user)
    visit pitches_path
    expect(Pitch.count).to eq 2
    first(".pitch-delete a").click
    expect(Pitch.count).to eq 1
  end

  scenario "from pitch index page" do
    login_as(@user)
    visit pitches_path
    expect(Pitch.count).to eq 2
    first("td a[data-method='delete']").click
    expect(Pitch.count).to eq 1
  end  
end