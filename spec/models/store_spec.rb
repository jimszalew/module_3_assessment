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
        VCR.use_cassette('store/zip_search') do
          stores = Store.zip_search('80202')

          expect(stores.count).to eq 10
          expect(stores.first).to be_a Store
        end
      end
    end

    context '.total_stores' do
      it 'returns the total number of stores by zipcode' do
        VCR.use_cassette('store/total_stores') do
          total = Store.total_stores('80202')

          expect(total).to eq 17
        end
      end
    end
  end
end
