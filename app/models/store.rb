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
    
  end
end
