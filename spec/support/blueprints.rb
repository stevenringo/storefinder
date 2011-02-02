require 'machinist/active_record'

Store.blueprint do
  lmaa          {""}
  customer_code {""}
  name          {""}
  address_1     {""}
  address_2     {""}
  suburb        {""}
  state         {""}
  postcode      {""}
  lat           {0.00}
  lng           {0.00}
end

Store.blueprint(:valid_address) do
  address_1     {"197 WILSON ST"}
  address_2     {""}
  suburb        {"NEWTOWN"}
  state         {"NSW"}
  postcode      {"2042"}
end

Store.blueprint(:invalid_address) do
  address_1     {"SHOPS 6 & 19 CAMPUS SHOPPING VILLAGE"}
  address_2     {"MCGREGOR ROAD"}
  suburb        {"SMITHFIELD"}
  state         {"QLD"}
  postcode      {"4878"}
end