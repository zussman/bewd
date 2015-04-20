
# Capitalization
boss_asks = 'What do you want, idiot?!'
puts boss_asks.upcase
reply = gets.chomp
puts 'WHADDAYA MEAN "' + reply.upcase + '"?!? YOU\'RE FIRED!!'

# Line Justification
line_width = 50
toc = 'Table of Contents'
c1 = 'Chapter 1: Getting Started'
c2 = 'Chapter 2: Numbers'
c3 = 'Chapter 3: Letters'
p1 = 'page 1'
p2 = 'page 9'
p3 = 'page 13'

puts toc.center(line_width)
puts ''
puts (c1.ljust(line_width/2) + p1.rjust(line_width/2))
puts (c2.ljust(line_width/2) + p2.rjust(line_width/2))
puts (c3.ljust(line_width/2) + p3.rjust(line_width/2))

# Fortune teller program
puts 'I am a fortune-teller. Tell me your name:'
name = gets.chomp

if name == 'Chris'
  puts 'I see great things in your future.'
else
  puts 'Your future is...oh my! Look at the time!'
  puts 'I really have to go, sorry!'
end

#Real while loop program
while 'Spike' > 'Angel'
  input = gets.chomp
  puts input
  if input == 'bye'
    break
  end
end

puts 'Come again soon!'

#99 Bottles of Beer on the Wall
