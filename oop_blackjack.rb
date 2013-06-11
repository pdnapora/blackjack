# this is the object-oriented implementation of the blackjack game for the 
# intro to web development with ruby class from tealeaf academy. 
# we'll create the necessary classes from nouns in the description of the
# program, and methods from the verbs.


class Person
attr_accessor :name, :total

  def initialize(name, total=0)
    @name = name
    @total = total
  end

  def speak(msg)
    puts "#{msg}"
  end

  def hit
    # code to stay
    puts 'hit me!'
  end

  def stay
    # code to hit
    puts "i'll stay."
  end

end

class Dealer < Person
  def deal
    puts 'dealing cards...'
  end
end

class Player < Person
end

class Card # cards are dealt from a Dealer object
end

class Deck
end

class Blackjack # the driver for the game
end

fred = Dealer.new('freddie', 50)
fred.speak('hello OOP world')
fred.speak("my total right now is #{fred.total}...")
fred.speak("my name is #{fred.name} and dealin's my game!")
fred.deal
fred.hit
fred.stay
