require "rails_helper"

RSpec.describe "BestbuyService" do
  context ".instance_methods" do
    context ".stores_by_zip" do
      it "returns a collection of stores by zip" do
        stores = BestbuyService.stores_by_zip("80202")

        expect(stores.count).to eq(10)
      end
    end

    context ".total_stores" do
      it "returns the total number of stores by zip" do
        total = BestbuyService.total_stores("80202")

        expect(total).to eq(17)
      end
    end
  end
end
