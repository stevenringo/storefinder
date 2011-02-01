require 'spec_helper'

describe Store do
    it "should create a new Store" do
      store = Store.make
      store.should be_valid
    end 
    
    it "should geolocate when possessing a valid address" do
      store = Store.make(:lat => nil, :lng => nil) #it's safe to assume machinist address is valid, given the purpose of this test?
      store.geocode_address
      #success (valid lat/lng)?
    end
    
    it "should throw a GeocodeError when not possessing a valid address" do
      store = Store.make(:address_1 => "invalid address",:lat => nil, :lng => nil)
      store.geocode_address
      #success (error thrown)?
    end
end


# 
# describe Message do
#    it "should create a new Message given valid attributes" do
#       Message.make
#    end
# 
#    it "should not be empty" do
#       blank_message = Message.make(:msg=>"")
#       blank_message.should_not be_valid
#    end
# 
#    it "should be less than 2500 characters long" do  
#       long_msg = "A" * 2501
#       long_message = Message.make(:msg=>long_msg)
#       long_message.should_not be_valid
#    end
# end