class Store < ActiveRecord::Base
  acts_as_mappable
  
  def address
    "#{address_1} #{address_2}, #{suburb}, #{state}, #{postcode}, Australia"
  end
  
  
  def geocode_address
	  loc = Store.geocode(address)
  	lat = loc.lat
  	lng = loc.lng
  end
end
