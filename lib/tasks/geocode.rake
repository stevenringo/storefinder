namespace :geocode do

  desc "Geocode all stores in database. Will overwrite existing lat and lng"
  task :all => :environment do
    stores = Store.all(:order => "id asc")
    store_count = stores.count
    stores.each_with_index do |store,index|
    	begin
        store.geocode_address
      	puts "#{index+1} of #{store_count} geocoded"
  	  rescue Geokit::Geocoders::GeocodeError => exception
  	    puts exception.message
  	    puts "store with id=#{store.id} failed to geocode address \"#{address}\""
    	end
    end
  end
  
end