require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(n),
        description: Faker::Hipster.paragraph(n),
        image: open_asset('apparel1.jpg'),
        quantity: 10*n,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path

    click_on @category.products[0].name
    # commented out b/c it's for debugging only
    #save_and_open_screenshot

    expect(page).to have_content(@category.products[0].name)
  end

end
