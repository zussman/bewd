#Using while
bottles = 99
while bottles > 1
  puts bottles.to_s + " bottles of beer on the wall, #{bottles.to_s} bottles of beer! You take one down and pass it around, #{(bottles - 1).to_s} bottles of beer on the wall!"
  bottles = bottles - 1
end
puts "1 bottle of beer on the wall, 1 bottle of beer! You take one down and pass it around, no more bottles of beer on the wall :-("