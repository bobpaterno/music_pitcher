feature "Add new song" do
  background do
    @user = Fabricate(:user)
  end

  scenario "user visits new song page" do
    login_as(@user)
    visit songs_path
    click_button "Add Song"
    expect(page).to have_content("New Song")
    expect(page).to have_content("Title")
    expect(page).to have_content("Artist")
    expect(page).to have_content("Genre")
    expect(page).to have_content("Description")
  end  
end