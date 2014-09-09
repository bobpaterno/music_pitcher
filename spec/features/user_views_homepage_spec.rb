feature "Home page" do
  scenario "admin is not logged in" do
    visit admin_login_path
    expect(page).to have_content("Admin Login Page")
  end

  scenario "admin is logged in" do
    visit admin_login_path
    expect(page).to have_content("Pitch Song")
    expect(page.current_path).to eq main_menu_path
  end
end
