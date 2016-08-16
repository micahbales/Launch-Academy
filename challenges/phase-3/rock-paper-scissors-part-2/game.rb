player_score = 0
computer_score = 0

while player_score < 2 && computer_score < 2 do

  puts "\nPlayer score: #{player_score} Computer score: #{computer_score}"
  print "Choose rock (r), paper (p), or scissors (s): "
  user_pick = gets.chomp.downcase

  if user_pick == "r" || user_pick == "p" || user_pick == "s"

    if user_pick == "r"
      user_pick = "rock"
    elsif user_pick == "p"
      user_pick = "paper"
    else
      user_pick = "scissors"
    end

    random = rand(3)
    if random == 0
      comp_pick = "rock"
    elsif random == 1
      comp_pick = "paper"
    else
      comp_pick = "scissors"
    end

    if user_pick == comp_pick
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "Tie, choose again.\n"
    elsif user_pick == "rock" && comp_pick == "scissors".capitalize
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "#{user_pick} beats #{comp_pick}, Player wins the round.\n".capitalize
      player_score += 1
    elsif user_pick == "rock" && comp_pick == "paper"
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "#{comp_pick} beats #{user_pick}, Computer wins the round.\n".capitalize
      computer_score += 1
    elsif user_pick == "paper" && comp_pick == "rock"
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "#{user_pick} beats #{comp_pick}, Player wins the round.\n".capitalize
      player_score += 1
    elsif user_pick == "paper" && comp_pick == "scissors"
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "#{comp_pick} beats #{user_pick}, Computer wins the round.\n".capitalize
      computer_score += 1
    elsif user_pick == "scissors" && comp_pick == "rock"
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "#{comp_pick} beats #{user_pick}, Computer wins the round.\n".capitalize
      computer_score += 1
    elsif user_pick == "scissors" && comp_pick == "paper"
      puts "\nPlayer chose #{user_pick}."
      puts "Computer chose #{comp_pick}."
      puts "#{comp_pick} beats #{user_pick}, Computer wins the round.\n".capitalize
      computer_score += 1
    end

  else
    puts "Invalid entry. Try again."
  end

end

  if player_score >= 2
    puts "\nPlayer wins the game!"
  else
    puts "\nComputer wins the game!"
  end
