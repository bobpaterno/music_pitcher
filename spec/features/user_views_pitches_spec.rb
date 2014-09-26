## User goes to Pitches Index page
# As a user
# In order to maintain my existing pitches and history
# I want to see an index of all pitches

# Usage
# * User navigates to Pitch Index page
# * User sees a summary of all pitches made

# Acceptance Criteria
# * User has the ability to see details of each entry
# * User has the ability to delete each entry
# * User sees Pitch Id, Pitch To, Sent On, and whether or not the pitch was opened (Listened To)

feature "user views an index of pitches" do
  background do
    @user = Fabricate(:user)
  end

  scenario "no pitches exist" do
    login_as(@user)
    visit pitches_path
    expect(page).to have_content("Pitches List")
    expect(page).to have_content("No pitches exist, click 'Add' to create one")
  end

  scenario "pitches exist" do
    pitch1 = Fabricate(:pitch)
    pitch2 = Fabricate(:pitch)
    login_as(@user)
    visit pitches_path
    expect(page).to have_content(pitch1.pitch_to)
    expect(page).to have_content("#{pitch1.id}")
    expect(page).to have_content(pitch1.created_at.strftime("%m/%d/%y %I:%H %p"))
    expect(page).to have_content("No") # should be no for the listened_to field
    expect(page).to have_content(pitch2.pitch_to)
    expect(page).to have_content("#{pitch2.id}")
    expect(page).to have_content(pitch2.created_at.strftime("%m/%d/%y %I:%H %p"))
    expect(page).to have_content("No")
  end
end
