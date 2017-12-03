require 'unirest'
require 'pp'

puts 'Please chose from the following menu: '
puts '[1] View all products'
puts '[2] View 1 product'
puts '[3] Create a new product'
user_input = gets.chomp
if user_input == '1'
  response = Unirest.get("http://localhost:3000/v1/products")
  product = response.body
  pp product
elsif user_input == '2'
  puts 'Enter a product number: '
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
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
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params )
  product = response.body
  pp product
elsif user
  params {}
end
