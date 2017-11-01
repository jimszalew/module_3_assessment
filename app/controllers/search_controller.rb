class SearchController < ApplicationController
  def index
    search = params[:search]
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{search},25)))?apiKey=#{ENV['bestbuy_api_key']}&format=json")
    json_stores = JSON.parse(response.body, symbolize_names: true)
    @total = json_stores[:total]
    @stores = json_stores[:stores].each do |store|
      Store.create(long_name: store[:longName], city: store[:city], distance: store[:distance], phone: store[:phone])
    end
  end
end
