class Store < ActiveRecord::Base
  acts_as_mappable
  
  def address_short
    "#{address_1} #{address_2} #{suburb}"
  end
  
  def address
    "#{address_1} #{address_2}, #{suburb}, #{state}, #{postcode}, Australia"
  end
  
  def geocode_address
	  loc = Store.geocode(address)
  	self.lat = loc.lat
  	self.lng = loc.lng
  end
end
