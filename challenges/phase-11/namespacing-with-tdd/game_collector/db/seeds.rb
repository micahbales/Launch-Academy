users = [
  { email: 'dan.pickett@launchacademy.com', first_name: 'Dan', last_name: 'Pickett', role: 'admin' },
  { email: 'evan.charles@launchacademy.com', first_name: 'Evan', last_name: 'Charles', role: 'admin' },
  { email: 'eric.kelly@launchacademy.com', first_name: 'Eric', last_name: 'Kelly', role: 'user' },
  { email: 'helen.hood@launchacademy.com', first_name: 'Helen', last_name: 'Hood', role: 'user' },
  { email: 'adam.sheehan@launchacademy.com', first_name: 'Adam', last_name: 'Sheehan', role: 'user' },
  { email: 'faizaan.shamsi@launchacademy.com', first_name: 'Faizaan', last_name: 'Shamsi', role: 'user' },
  { email: 'richard.davis@launchacademy.com', first_name: 'Richard', last_name: 'Davis', role: 'admin' },
]

users.each do |user_params|
  user = User.find_or_initialize_by(user_params)
  password = SecureRandom.hex(8)
  user.password = password
  user.password_confirmation = password
  user.save!
end


board_games = [
  { name: "Ticket to Ride",
    publisher: "Days of Wonder",
    description: "Build train routes across the continent.",
    min_players: 2,
    max_players: 5,
    release_date: "2000/01/30" },

  { name: "Power Grid",
    publisher: "Rio Grande Games",
    description: "Supply the most cities with electric power.",
    min_players: 2,
    max_players: 6,
    release_date: nil },

  { name: "Blokus",
    publisher: "Mattel",
    description: "Tetris-like strategy game.",
    min_players: 2,
    max_players: 4,
    release_date: "2000/06/01" },

  { name: "Agricola",
    publisher: "Z-Man Games",
    description: "Farming simulator.",
    min_players: 1,
    max_players: 5,
    release_date: "2007/06/01" },

  { name: "Ruerto Rico",
    publisher: "Rio Grande Games",
    description: "Select a role (mayor, captain, settler, trader, etc) and build your colony in the new world.",
    min_players: 3,
    max_players: 5,
    release_date: "2000/01/30" },
]

board_games.each do |board_game_params|
  board_game = BoardGame.find_or_initialize_by(board_game_params)
  board_game.save!
end
