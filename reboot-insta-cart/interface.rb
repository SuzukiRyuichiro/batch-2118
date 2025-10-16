# interface.rb

# Pseudo-code
# 1. Print Welcome
puts '-' * 20
puts 'Welcome to Instacart'
puts '-' * 20

# 2. Define your store (what items are for sale?)
# Define a hash that represent the product in the shop
shop = {
  # 'beer' => { price: 1.5, quantity: 10 }, :This is for part 3
  'beer' => 1.5,
  'wine' => 10,
  'cheese' => 5.5,
  'crackers' => 1,
  'chips' => 2.5
}

# key is the item name (e.g. 'kiwi') the value should be the price (e.g 1.5)
# print out the name and price of products (hint: Hash#each)
puts "Here's what we have!"
shop.each do |product, price|
  puts "> #{product}: $#{price}"
end

# initialize a cart as hash, key is the product, value is quantity (e.g 3)
cart = {}

item = ''

until item == 'quit'
  # loop starts here (ok to do it later)
  # 3. Get items from the user (shopping)
  # print "> Which item? (or 'quit' to checkout)"
  puts "> Which item? (or 'quit' to checkout)"
  # get user's input
  item = gets.chomp.downcase
  # if the user types a product that exist in the shop (hint: Hash#key?)

  if shop.key?(item)
    # add them to the cart
    puts '> How many would you like?'
    amount = gets.chomp.to_i

    if cart.key?(item)
      cart[item] += amount
    else
      cart[item] = amount
    end
  elsif item == 'quit'
    # if the user types 'quit' then proceed to checkout (exit the loop)
    puts 'Checkout is this way ➡️'
  else
    # if the user types a product that doesn't exist, print "Sorry, we don't have pineapple today."
    puts "Sorry, we don't have #{item} today."
  end
end

# cart looks like this
# cart = {"beer"=>2, "cheese"=>1, "crackers"=>1}

# 4. Print the bill (checkout)

sum = 0
# iterate over the cart (each iteration gets product name and quantity)
puts '=' * 20

cart.each do |item, quantity|
  # get the price of single item
  price = shop[item]
  # multiply that by the quantity in the cart,
  subtotal = price * quantity
  puts "#{item}: $#{price} X #{quantity} = $#{subtotal}"
  # add that to the sum
  sum += subtotal
end

puts '=' * 20

# finally print out the total bill
puts "TOTAL: $#{sum}"
