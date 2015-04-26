def say_moo number_of_moos
  puts 'moooooo...' * number_of_moos
  #'yellow submarine'
end

x = say_moo 2
puts x

def ask question
  good_answer = false
  while (not good_answer)
    puts question
    reply = gets.chomp.downcase

    if (reply == 'yes' or reply == 'no')
      good_answer = true
      if reply = 'yes'
        answer = true
      else
        answer = false
      end
    else
      puts 'Please answer "yes" or "no".'
    end
  end

  answer # This is what we return (true or false)
end

puts 'Hello, and thank you for...'
puts

ask 'Do you like eating tacos?' #We'll ignore this return value
ask 'Do you like eating burritos?' #We'll ignore this return value
picks_nose = ask 'Do you pick your nose?' #We'll save this return value
ask 'Do you like eating chimichangas?'
ask 'Do you like eating sopapillas?'
ask 'Do you like eating tamales?'
puts 'Just a few more questions...'
puts
puts 'DEBRIEFING:'
puts 'Thank you for...'
puts
puts picks_nose