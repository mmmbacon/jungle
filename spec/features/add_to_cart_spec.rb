require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(1),
        description: Faker::Hipster.paragraph(1),
        image: open_asset('apparel1.jpg'),
        quantity: 10*n,
        price: 64.99
      )
    end
  end

  scenario "They see the product cart" do
    visit root_path

    puts page.html
    find(".product", match: :first).click_on("Add")
    # commented out b/c it's for debugging only
    save_and_open_screenshot

    expect(page).to have_content("My Cart (1)")
  end


end
