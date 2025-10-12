# Ruby quiz recap

What’s a variable? What’s the point of using variables? Give an example.

Store something so you can use them later

```
age = 30
```

Precisely describe what happens at **each line** using good vocabulary. Write a ruby comment next to the line you’re explaining using the `#`.

Code example given to the student:

```ruby
def multiply(x, y) # creating a method and name them multiply. giving arguments with x and y
  return x * y     # return the answer of x * y
end                # end the method

puts multiply(5, 8) # call the method provide arguments 5 and 8, and display the result -> 40
```



What’s the keyword `if` ? Give us an example of `if` statements, using an `age` variable storing a student’s age for instance.

Code example given to the student:

```ruby
# TODO: write some code with `if`
age = 20

if age >= 18
	puts "you can vote"
else
	puts "you cannot vote"
end
```



Complete the following code to compute the **exact** average of students grades (using `each` ).

Code example given to the student:

```ruby
grades = [19, 8, 11, 15, 13]
# TODO: compute and store the result in a variable `average`

# average = grades.sum / grades.size.to_f -> shortest solution

sum = 0

grades.each do |grade|
  sum += grade
end

average = sum / grades.count.to_f

puts average
```



**Define a** `capitalize_name` **method which takes** `first_name` **and** `last_name` **as parameters and returns the well-formatted fullname (with capitalized first and last names).**

```ruby
def capitalize_name(first_name, last_name)
  return "#{first_name.capitalize} #{last_name.capitalize}"
end

capitalize_name('john', 'adams') => "John Adams"
capitalize_name('JOHN', 'LEnnOn') => "John Lennon"
```



What’s the difference between **concatenation** and **interpolation**? Give an example.

```ruby
name = 'Scooter'
nationality = 'Japanese'

puts "#{name} is #{nationality}"

puts name + " is " + nationality
```

Translate each line of pseudo-code into ruby.

Code example given to the student:

```ruby
fruits = ["banana", "peach", "watermelon", "orange"]

# Print out "peach" from the fruits array in the terminal
fruits[1]
# Add an "apple" to the fruits array
fruits[4] = "apple"
fruits << "apple"
# Replace "watermelon" by "pear"
fruits[2] = "pear"
# Delete "orange"
fruits.reject! { |fruit| fruit == 'orange' }
fruits.delete('orange')
fruits.delete_at(3)
```





Translate each line of pseudo-code into ruby.

Code example given to the student:

```ruby
city = { name: "Paris", population: 2000000 }

# Print out the name of the city
puts city[:name]
# Add the Eiffel Tower to city with the `:monument` key
city[:monument] = 'Eiffel Tower'
# Update the population to 2000001
city[:population] = 2000001
city[:population] += 1
# What will the following code return?
city[:mayor] # nil
```



Use the `map` iterator to convert the variable `students`, an array of arrays, into an array of hashes.Those hashes should have two keys: `:name` and `:age`. What is the type of those keys?

Code example given to the student:

```ruby
students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]

# TODO: Convert the array of arrays into an array of hashes.

students_h = students.map do |student|
  {
    name: student[0],
    age: student[1]
  }
end

# Advanced syntax: destructuring
students.map do |name, age|
  {
    name: name,
    age: age
  }
end



# [{ name: "john", age: 28 }, { name: "mary", age: 25 }, { name: "paul", age: 21 }]
```

