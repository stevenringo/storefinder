require 'spec_helper'

describe Store do
    it "should create a new Store" do
      store = Store.make
      store.should be_valid
    end 
    
    it "should geolocate when possessing a valid address" do
      store = Store.make(:lat => nil, :lng => nil) #is it safe to assume machinist address is valid, given the purpose of this test?
      lambda {
        store.geocode_address
      }.should_not raise_error
    end
    
    it "should throw a GeocodeError when not possessing a valid address" do
      store = Store.make(:address_1 => "SHOPS 6 & 19 CAMPUS SHOPPING VILLAGE", 
                         :address_2 => "MCGREGOR ROAD",
                         :suburb    => "SMITHFIELD",
                         :state     => "QLD",
                         :postcode  => "4878",
                         :lat       => nil, 
                         :lng       => nil)
      lambda { 
        store.geocode_address 
      }.should raise_error(Geokit::Geocoders::GeocodeError)
    end
end