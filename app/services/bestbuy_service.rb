class BestbuyService
  def initialize
    @conn = Faraday.new("https://api.bestbuy.com/v1/stores((area(#{zipcode},25)))?apiKey=#{ENV['bestbuy_api_key']}&format=json")
  end
end
