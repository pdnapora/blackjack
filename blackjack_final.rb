# blackjack program - from tealeaf academy's intro to web dev course
# this is a console version- it will be the basis for an OOP version
# followed by a web version using the sinatra framework as a final project

def calculate_total(cards)
  # map the numeric value from the hand dealt
  arr = cards.map{|e| e[1]}  

  total = 0
  arr.each do |value|
    if value == "a"
      total += 11
    elsif value.to_i == 0 # at this point, only j, q, k possible
      total += 10
    else
      total += value.to_i
    end
  end
  
  # correct for aces
  arr.select{|e| e == "a"}.count.times do
    total -= 10 if total > 21
  end

  total
end

suites = ['h', 'd', 's', 'c']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'a', 'j', 'q', 'k']

deck = suites.product(cards) # cards, including suites
deck.shuffle! # all mixed up

dealer_cards = []
player_cards = []

player_cards << deck.pop # deal cards to dealer + player in turn 
dealer_cards << deck.pop 
player_cards << deck.pop
dealer_cards << deck.pop

puts 'welcome to blackjack. what should i call you?'
name = gets.chomp
puts "great, here we go #{name}."

dealer_total = calculate_total(dealer_cards)  
player_total = calculate_total(player_cards)

# show cards for each
puts "dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}, for a total of #{dealer_total}." 
puts "you have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."
puts

# player takes turn
if player_total == 21
  puts "BLACKJACK!! YOU WIN"
  exit
end

while player_total < 21

  puts '1) hit'
  puts '2) stay'
  play = gets.chomp

  if !(play == '1' || play == '2')
    puts 'you must enter "1" to hit or "2" to stay'
    next
  end

  if play == '2'
    puts "#{name} stays with #{player_total}"
    break
  end

  # if hit
  new_card = deck.pop
  puts "you have #{new_card}"
  player_cards << new_card
  player_total = calculate_total(player_cards)
  puts "you have #{player_total}"

  if player_total == 21
    puts 'BLACKJACK!! YOU WIN!!'
    exit
  elsif player_total > 21
    puts 'sorry, you busted...'
    exit
  end
end

# house takes turn
if dealer_total == 21
  puts 'house has blackjack, sorry you lose...'
  exit
end

while dealer_total < 17
  # house must hit up to 16, stays on 17
  new_card = deck.pop
  puts 'dealing card...'
  puts "house gets #{new_card}"
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
  puts "house now has: #{dealer_total}"

  if dealer_total == 21
    puts 'sorry, house has blackjack. you lose...'
    exit
  elsif dealer_total > 21
    puts 'house busts! congratulations, you win.'
    exit
  end
end
      

# compare player hand w/ dealer hand
puts 'dealer has: '
dealer_cards.each do |card|
  puts "#{card}"
end

puts

puts 'you have: '
player_cards.each do |card|
  puts "#{card}"
end

puts

if dealer_total > player_total
  puts 'YOU LOSE!!'
elsif dealer_total < player_total
  puts 'YOU WIN!!'
else
  puts 'tie game...nobody wins.'
end

exit

