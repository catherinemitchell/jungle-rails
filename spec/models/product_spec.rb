require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validate name
    it 'is must have a name to be valid' do
      @category = Category.new
      params = {
      description: 'The Giant Tea....',
      quantity: 0,
      category: @category,
      price_cents: 64.99
      }
      product = Product.new(params)
      expect(product.valid?).to be(false)
    end


    #validate Price
    it "is must have a price to be valid" do
      @category = Category.new
      params = {
      name: 'Enirthelda',
      description: 'The Enirthelda is an uncommon, large plant and can be found only in some forests. It blooms once a year, for 2 months.
      It has narrow, barb shaped leaves, which are usually blue-green. It also grows huge flowers, which can be purple and light red.....',
      quantity: 8,
      category: @category
      }
      product = Product.new(params)
      expect(product.valid?).to be(false)
    end
    
    # validate Quantity
    it "is not valid without a quantity" do
       @category = Category.new
      params = {
      name: 'Bone Coneflower',
      description: 'The Bone Coneflower is an uncommon, small plant and can be found only in some forests. It blooms in early spring.....',
      category: @category,
      price_cents: 24.99
      }
      product = Product.new(params)
      expect(product.valid?).to be(false)
    end

    # validate Category
    it "is not valid without a category" do
      @category = Category.new
      params = {
      name:  'Lion Grapevine',
      description: "The Lion Grapevine is an uncommon, modest plant and can be found only in some humid regions. It blooms once a year, for 4 months.",
      quantity: 4,
      price: 34.49
      }
      product = Product.new(params)
      expect(product.valid?).to be(false)
    end


    it "is valid with a category" do
      @category = Category.new
      params = {
      name:  'Lion Grapevine',
      description: "The Lion Grapevine is an uncommon, modest plant and can be found only in some humid regions. It blooms once a year, for 4 months.",
      quantity: 4,
      category: @category,
      price: 34.49
      }
      product = Product.new(params)
      expect(product.valid?).to be(true)
    end

    it 'is invalid without a name' do
      @category = Category.create
      params = {
        description: 'The Giant Tea...', 
        price: 64.99, 
        quantity: 0, 
        category: @category}
        product = Product.new(params)
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

  end
end
