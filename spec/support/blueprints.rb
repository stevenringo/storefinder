require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

#Sham.name { Faker::Name.name }
# Store.blueprint do
#   lmaa           {"SR200937"}
#   customer_code {"05558411"}
#   name          {"TRISTAN'S LIQUOR EMPORIUM"}
#   address_1     {"197 WILSON ST"}
#   address_2     {""}
#   suburb        {"NEWTOWN"}
#   state         {"NSW"}
#   postcode      {"2042"}
#   lat           {"-33.8949"}
#   lng           {"151.1870"}
# end

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