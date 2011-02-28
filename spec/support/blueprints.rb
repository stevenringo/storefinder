require 'machinist/active_record'

Product.blueprint do
  name          { "Some strange Shiraz" }
end

Store.blueprint do
  customer_code { "0213387" }
  name          { "BWS Somewhere" }
  address_1     { "Shop 1" }
  address_2     { "193 Some Street" }
  suburb        { "Someplace" }
  state         { "NSW" }
  postcode      { "1111" }
  lat           { -25.0 }
  lng           { 135.0 }
end

Store.blueprint(:valid_address) do
  address_1     { "197 WILSON ST" }
  address_2     { "" }
  suburb        { "NEWTOWN" }
  state         { "NSW" }
  postcode      { "2042" }
end

Store.blueprint(:invalid_address) do
  address_1     { "SHOPS 6 & 19 CAMPUS SHOPPING VILLAGE" }
  address_2     { "MCGREGOR ROAD" }
  suburb        { "SMITHFIELD" }
  state         { "QLD" }
  postcode      { "4878" }
end