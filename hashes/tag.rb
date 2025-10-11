def tag(name, content, attributes = {}) # attributes is a hash
  # format the attributes
  formatted_attributes = [] # goal: ['class="text-bold"', 'style="color: red;"']

  attributes.each do |key, value|
    # format the key and the value to desired structure e.g. 'class="text-bold"'
    formatted_attribute = "#{key}=\"#{value}\""
    # put them into the formatted attributes array
    formatted_attributes << formatted_attribute
  end

  # join the attributes and interpolate
  "<#{name} #{formatted_attributes.join(' ')}>#{content}</#{name}>"
end

p tag("h1", "hello world")
# => "<h1>hello world</h1>"

p tag("h1", "hello world", class: 'text-bold')
# => "<h1 class="text-bold">hello world</h1>"
p tag("p", "welcome to le wagon", class: 'text-uppercase', style: 'color: red;')
# => "<p class="text-uppercase" style="color: red;">welcome to le wagon</p>"
