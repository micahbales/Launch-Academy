require_relative "deck"
require_relative "hand"
require_relative "card"

deck = Deck.new
player_hand = Hand.new(Card.new(deck.deal))
puts "player was dealt #{player_hand.cards[0].rank}#{player_hand.cards[0].suit}"
computer_hand = Hand.new(Card.new(deck.deal))
puts "dealer draws #{computer_hand.cards[0].rank}#{computer_hand.cards[0].suit}"
1.times do
  a = Card.new(deck.deal)
  player_hand.cards << a
  puts "Player was dealt #{a.rank}#{a.suit}"
  b = Card.new(deck.deal)
  computer_hand.cards << b
  puts "Dealer draws #{b.rank}#{b.suit}"
end

player_turn = true
while player_turn == true do
  player_score = player_hand.calculate_hand
  if player_score > 21

    puts "Bust! Game over..."
    break
  end

  puts "\nYour current score is: #{player_score}"
  puts "Would you like to hit, or stand? (h/s)\n"
  user_hit = gets.chomp

  if user_hit.downcase == "h"
    new_card = Card.new(deck.deal)
    player_hand.cards << new_card
    puts "You draw a #{new_card.rank}#{new_card.suit}"
    puts "Score: #{player_score}"
  elsif user_hit.downcase == "s"
    puts "You stand"
    puts "Score: #{player_score}"
    player_turn = false
  else
    puts "Invalid entry. Would you like to hit (h) or stand (s)?"
  end
end

if player_turn == false

  computer_turn = true
  while computer_turn == true do
    computer_score = computer_hand.calculate_hand
    puts "Dealer Score: #{computer_score}"
    if computer_score > 21
      puts "Dealer busts!"
      break
    end

    if computer_score < 17
      new_card = Card.new(deck.deal)
      computer_hand.cards << new_card
      puts "Dealer draws a #{new_card.rank}#{new_card.suit}"
    else
      computer_turn = false
      puts "Dealer stays, at #{computer_score}"
    end
  end
  puts "Player score: #{player_score}\nDealer Score: #{computer_score}"
  if computer_score > player_score && computer_score <= 21
    puts "Dealer wins!"
  elsif computer_score == player_score
    puts "Tie! All bets are off!"
  else
    puts "Player wins!"
  end
end
