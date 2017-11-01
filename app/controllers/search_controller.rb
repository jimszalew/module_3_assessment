class SearchController < ApplicationController
  def index
    search = params[:search]
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=a8k7nnexb87aa9hb3zzqbgf7&format=json") do |faraday|
      faraday.adapter Faraday.default_adapter
      # faraday.headers["apiKey"] = ENV['bestbuy_api_key']
    end
    require "pry"; binding.pry
  end
end
