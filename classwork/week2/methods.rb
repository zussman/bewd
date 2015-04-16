def toaster(color, bread)
  return "#{color} #{bread} is now toasty!"
end

puts "Insert some bread."

loaf = gets.chomp

puts "What is your favorite color?"

hue = gets.chomp

puts toaster(hue, loaf)