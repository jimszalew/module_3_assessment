class SearchController < ApplicationController
  def index
    @stores = Store.zip_search(params[:search])



    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{params[:search]},25)))?apiKey=#{ENV['bestbuy_api_key']}&format=json")
    json_stores = JSON.parse(response.body, symbolize_names: true)
    @total = json_stores[:total]
    @stores = json_stores[:stores].map do |store|
      Store.new(long_name: store[:longName], city: store[:city], distance: store[:distance], phone: store[:phone])
    end
  end
end
