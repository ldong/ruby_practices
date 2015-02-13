# Loops
number = 0
loop do
  break if number > 15
  puts "The number is #{number}"
  number += 1
end

until number > 30
  puts "The number is #{number}"
  number += 1
end

while number < 40 do
  puts "The number is #{number}"
  number += 1
end

for i in 1..8 do
   puts i
end

16.times do |number|
  puts "The number is #{number}"
end

5.times { |i| puts i }

5.upto 10 do
  puts 'Hi'
end

15.downto(10) {|i| puts i }

list = [0, 1, 2, 3, 4]
list.each do |number|
  puts "The number inside the loop is #{number}"
end

(0..15).each do |number|
  puts "The number inside the loop is #{number}"
end

for number in 0..15
  puts "The number inside the loop is #{number}"
end

# Blocks
def form &block
  puts '<form>'
  yield if block_given?
  puts '</form>'
end

def paragraph text
  puts '<p>' + text + '</p>'
end

def quote text
  puts '<quote>' + text + '</quote>'
end

form do
  paragraph 'This is a graph'
  quote 'This is a quote'
end

form
