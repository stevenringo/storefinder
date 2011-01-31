namespace :geocode do

  desc "Geocode all stores in database. Will overwrite existing lat and lng"
  task :all => :environment do
    stores = Store.all(:order => "id asc")
    store_count = stores.count
    stores.each_with_index do |store,index|
    	loc = Store.geocode("#{store.address_1} #{store.address_2}, #{store.suburb}, #{store.state}, #{store.postcode}, Australia")
    	store.lat = loc.lat
    	store.lng = loc.lng
    	store.save!
    	puts "#{index} of #{store_count} geocoded"
    end
  end
  
end