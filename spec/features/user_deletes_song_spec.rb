feature "user deletes song" do
  background do
    @user = Fabricate(:user)
    @song1 = Fabricate(:song, title: "Hey Delete Me")
    @song2 = Fabricate(:song, title: "Don't Delete Me")
    login_as(@user)
    visit songs_path
  end

  scenario "delete an existing song" do
    expect(page).to have_content("Hey Delete Me")
    expect(page).to have_content("Don't Delete Me")
    click_on "Hey Delete Me"
    click_button "Delete Song"
    expect(page.current_path).to eq songs_path
    expect(page).to have_content("Don't Delete Me")
    expect(page).not_to have_content("Hey Delete Me")
  end
end