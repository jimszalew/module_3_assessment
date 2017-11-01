require "rails_helper"

RSpec.describe "User searches for best buy stores" do
  context "by zipcode" do
    it "and sees stores matching the search params" do
      VCR.use_cassette("search_by_zip") do
        visit "/"

        fill_in :search, with: "80202"
        click_on "Search for Stores"

        expect(current_path).to eq("/search")
        expect(page).to have_content("17 Total Stores")
        expect(page).to have_css(".store")

        within(first(".store")) do
          expect(page).to have_css(".long_name")
          expect(page).to have_css(".city")
          expect(page).to have_css(".distance")
          expect(page).to have_css(".phone")
        end
      end
    end
  end
end
