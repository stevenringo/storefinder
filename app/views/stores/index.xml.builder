xml.instruct! 
xml.markers do
  @stores.each do |store|
  	xml.marker('name' => store.name, "lat" => store.lat, "lng" => store.lng, "address" => store.address_1)
  end
end