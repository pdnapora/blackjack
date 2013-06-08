# blackjack program - from tealeaf academy's intro to web dev course
# this is a console application with few features

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
puts '1) hit'
puts '2) stay'
play = gets.chomp

puts calculate_total(dealer_cards)
puts calculate_total(player_cards)

