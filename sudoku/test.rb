color = {
  port:  'red',
  starboard:  'green'

}

location = [:fore, :aft]

left = color[:port]
right = color[:starboard]

puts "The left running light is #{left}"
puts "The right running light is #{right}"

puts "the index of fore is #{location.find_index(:fore)}"
puts "the index of aft is #{location.find_index(:aft)}"
puts "The value of :fore is #{:fore}"
