# # User goes to Pitches Show page
# As a user
# In order to see details and status regarding an existing pitch
# I want to see a show page for a given pitch

# Usage
# * User navigates to Pitch Index page
# * User clicks on "Details" or "Pitch ID: <id>"
# * User sees Pitch Show page

# Acceptance Criteria
# * User must be logged in
# * User sees pitch id, pitch_to, pitch_notes, email, subject, message, created_at, and listened_to fields
# * User sees link to delete pitch

feature "pitch show page" do
  background do
    @user = Fabricate(:user)
  end

  scenario "no pitch exists" do
    login_as(@user)
    visit pitch_path(1)
    expect(page).to have_content("Sorry, could not find the pitch you're looking for")
  end

  scenario "pitch exists" do
    @pitch1 = Fabricate(:pitch)
    @pitch2 = Fabricate(:pitch, pitch_notes: "These are pitch notes")
    login_as(@user)
    visit pitches_path
    click_on "Pitch ID: #{@pitch2.id}"
    expect(page).to have_content("#{@pitch2.pitch_to}")
    expect(page).to have_content("These are pitch notes")
    expect(page).to have_content("#{@pitch2.email}")
    expect(page).to have_content("#{@pitch2.subject}")
    expect(page).to have_content("#{@pitch2.message}")
    expect(page).to have_content("No") # view converts false to "No"
    click_button "Back"
    expect(page.current_path).to eq pitches_path
  end

    scenario "click delete button in show" do
    @pitch1 = Fabricate(:pitch)
    @pitch2 = Fabricate(:pitch, pitch_notes: "These are pitch notes")
    login_as(@user)
    visit pitches_path
    click_on "Pitch ID: #{@pitch2.id}"
    expect(page.has_button?("Delete")).to eq true
  end

end