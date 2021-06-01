require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @product = Product.new( 
        name: "Hammer",
        description: "It's a hammer",
        quantity: 10,
        price: 1000,
        category: Category.new( name: "Tools")
      )
    end

    it 'validates the name is present' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank") 
    end

    it 'validates the price is present' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages[2]).to eq("Price can't be blank")
    end

    it 'validates a quantity is present' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'validates a category is present' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end
  end
end
