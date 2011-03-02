namespace :geocode do

  desc "Geocode all stores in database. Will overwrite existing lat and lng"
  task :all => :environment do
    stores = Store.all(:order => "id asc")
    store_count = stores.count
    stores.each_with_index do |store,index|
      begin
        store.geocode_address
        store.save!
        puts "#{index+1} of #{store_count} geocoded"
      rescue Geokit::Geocoders::GeocodeError => exception
        puts exception.message
        puts "store with id=#{store.id} failed to geocode"
      end
    end
  end
  desc "Geocode single store in database. Will overwrite existing lat and lng"
  task :one => :environment do
    store = Store.find(281)
    begin
      store.geocode_address
      store.save!
      puts "#{store.address} geocoded"
    rescue Geokit::Geocoders::GeocodeError => exception
      puts exception.message
      puts "store failed to geocode"
    end
  end
  
end