require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '#class_methods' do
    context '#initialize' do
      it 'exists' do
        store = Store.new(
          long_name: "dude",
          city: "dude",
          distance: "dude",
          phone: "dude")

        expect(store).to be_a Store
      end
    end
  end

  describe '.instance_methods' do
    context '.zip_search' do
      it 'returns stores filtered by zip code' do
        stores = Store.zip_search('80202')
        require "pry"; binding.pry
          expect(stores.count).to eq 10
          expect(stores.first).to be_a Store
      end
    end
  end
end
