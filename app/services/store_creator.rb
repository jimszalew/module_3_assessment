class StoreCreator
  def initialize(store_info)
    @long_name = store_info[:long_name]
    @city      = store_info[:city]
    @distance  = store_info[:distance]
    @phone     = store_info[:phone]
    Store.create(
      long_name: @long_name,
      city: @city,
      distance: @distance,
      phone: @phone)
  end
end
