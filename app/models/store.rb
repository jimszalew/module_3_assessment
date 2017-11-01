class Store < ActiveRecord::Base
  attr_reader :long_name,
              :city,
              :distance,
              :phone

  def initialize(store_info)
    @long_name = store_info[:long_name]
    @city      = store_info[:city]
    @distance  = store_info[:distance]
    @phone     = store_info[:phone]
  end

  def self.zip_search(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{zipcode},25)))?apiKey=#{ENV['bestbuy_api_key']}&format=json")
    json_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    json_stores.map do |store|
      Store.new(long_name: store[:longName], city: store[:city], distance: store[:distance], phone: store[:phone])
    end
  end

  def self.total_stores(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{zipcode},25)))?apiKey=#{ENV['bestbuy_api_key']}&format=json")
    json_stores = JSON.parse(response.body, symbolize_names: true)[:total]
  end
end
