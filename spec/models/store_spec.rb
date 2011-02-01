require 'spec_helper'

describe Store do
  
  
    it "should find correct latitude after geolocating with a valid address" do
      store = Store.make!(:valid_address)
      store.geocode_address
      store.lat.should be_within(0.01).of(-33.8947932)
      #store.should validate_presence_of :lat
      #TEST VALIDATION
    end
    
    it "should find correct longitude after geolocating with a valid address" do
      store = Store.make!(:valid_address) 
      store.geocode_address
      store.lng.should be_within(0.01).of(151.1869711)
    end
    
    it "should throw a GeocodeError when not possessing a valid address" do
      store = Store.make!(:invalid_address)
      lambda { 
        store.geocode_address 
      }.should raise_error(Geokit::Geocoders::GeocodeError)
    end
end