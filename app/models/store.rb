class Store < ActiveRecord::Base
  acts_as_mappable
  validates_presence_of :lat, :on => :create, :message => "can't be blank"
  validates_presence_of :lng, :on => :create, :message => "can't be blank"
  
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
