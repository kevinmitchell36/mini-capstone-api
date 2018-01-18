require 'unirest'
require 'pp'

base_url = "http://localhost:3000/v1/products"

puts 'Please chose from the following menu: '
puts '[1] View all products'
puts '[2] View 1 product'
puts '[3] Create a new product'
puts '[4] Update a product'
user_input = gets.chomp
if user_input == '1'
  response = Unirest.get("#{base_url}")
  product = response.body
  pp product
elsif user_input == '2'
  puts 'Enter a product number: '
  product_id = gets.chomp
  response = Unirest.get("#{base_url}/#{product_id}")
  product = response.body
  pp product
elsif user_input == '3'
  params = {}
  print 'Enter a name: '
  params[:name] = gets.chomp
  print 'Enter a price: '
  params[:price] = gets.chomp
  print 'Enter a image '
  params[:image] = gets.chomp
  print 'Enter a description '
  params[:description] = gets.chomp
  response = Unirest.post("#{base_url}/", parameters: params)
  product = response.body
  pp product
elsif user_input == '4'
  print 'Enter a product id '
  product_id = gets.chomp
  response = Unirest.get("#{base_url}/#{product_id}")
  product = response.body
  pp product
  params = {}
  print "Update name (#{product["name"]}): "
  params[:name] = gets.chomp
  print "Update price (#{product["price"]}): "
  params[:price] = gets.chomp
  print "Update image (#{product["image"]}): "
  params[:image] = gets.chomp
  print "Update description (#{product["description"]}): "
  params[:description] = gets.chomp
  params.delete_if { |key, value| value.empty? }
  response = Unirest.patch("#{base_url}/#{product_id}", parameters: params)
  product = response.body
  pp product

end
