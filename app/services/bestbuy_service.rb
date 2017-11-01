class BestbuyService
  def initialize
    @conn = Faraday.new("https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.stores_by_zip(zipcode)
    response = @conn.get("/v1/stores((area(#{zipcode},25)))?apiKey=#{ENV['bestbuy_api_key']}&format=json")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
