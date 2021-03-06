require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  Random.new.rand(10) + 1
end

def display_card_total total
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game total
  if total > 21
    puts "Sorry, you hit #{total}. Thanks for playing!"
  end
end

def initial_round
  initial = deal_card + deal_card
  display_card_total initial
  initial
end

def hit? total
  prompt_user
  input = get_user_input

  while !valid_input?(input)
    invalid_command
    prompt_user
    input = get_user_input
  end

  if input == 'h'
    total = total + deal_card
  end


   total
end

def valid_input? input
   input == 'h' || input == 's'
end


def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  total = initial_round
  while total < 22
    total = hit? total
    display_card_total total
  end
  end_game total
end
    
