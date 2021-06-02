require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    user = User.create!(
      first_name:  "Dave",
      last_name: "Smith",
      email: "davesmith@email.com",
      password: "password1234",
      password_confirmation: "password1234"
    )
  end

  scenario "They see the product cart" do
    visit root_path

    click_link("Login")
    fill_in 'email', with: 'davesmith@email.com'
    fill_in 'password', with: 'password1234'
    puts page.html
    find("[name='commit']").click
    # commented out b/c it's for debugging only
    save_and_open_screenshot

    expect(page).to have_content("Dave")
  end
end
