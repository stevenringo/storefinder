require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

#Sham.name { Faker::Name.name }
Store.blueprint do
  lmaa {"SR200937"}
  customer_code {"05558411"}
  name {"TRISTAN'S LIQUOR EMPORIUM"}
  address_1 {"197 WILSON ST"}
  address_2 {""}
  suburb {"NEWTOWN"}
  state {"NSW"}
  postcode {"2042"}
  lat {"-33.8949"}
  lng {"151.1870"}
end