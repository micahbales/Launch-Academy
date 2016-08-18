ALBUMS = [
  {
    title: "Firefly (Original Soundtrack)",
    category: "Television",
    artist: "Greg Edmonson",
    year: 2005,
    tracks: [
      "Firefly - Main Title",
      "Big Bar Fight",
      "Heart of Gold Montage",
      "Whitefall / Book",
      "Early Takes Serenity",
      "The Funeral",
      "Rivers Perception / Saffron",
      "Mal Fights Niska / Back Home",
      "River Tricks Early",
      "River Understands Simon",
      "Leaving / Caper / Spaceball",
      "Rivers Afraid / Niska / Torture",
      "In My Bunk / Jaynes Statue / Boom",
      "Inaras Suite",
      "Out Of Gas / Empty Derelict",
      "Books Hair / Ready For Battle",
      "Tears / Rivers Eyes",
      "Cows / New Dress / My Crew",
      "Boarding The Serenity / Derelict",
      "Burgess Kills / Captain & Ship",
      "Saved / Isnt Home? / Reavers",
      "Reavers Chase Serenity",
      "Rivers Dance",
      "Inside The Tam House",
      "Dying Ship / Naked Mal",
    ]
  },
  {
    title: "Blade Runner (Official Score)",
    category: "Movie",
    artist: "Vangelis",
    year: 1994,
    tracks: [
      "Main Titles",
      "Blush Response",
      "Wait for Me",
      "Rachel's Song",
      "Love Theme",
      "One More Kiss, Dear",
      "Blade Runner Blues",
      "Memories of Green",
      "Tales of the Future",
      "Damask Rose",
      "Blade Runner (End Titles)",
      "Tears in Rain"
    ]
  },
  {
    title: "The Terminator (The Definitive Edition Remaster)",
    category: "Movie",
    artist: "Brad Fiedel",
    year: 1994,
    tracks: [
      "Theme from 'The Terminator'",
      "'The Terminator' Main Title",
      "The Terminator's Arrival",
      "Reese Chased",
      "Sarah on Her Motorbike",
      "Gun Shop/Reese in Alley",
      "Sarah in the Bar",
      "Tech Noir/Alley Chase",
      "Garage Chase",
      "Arm & Eye Surgery",
      "Police Station/Escape from Police Station",
      "Future Flashback/Terminator Infiltration",
      "Conversation by the Window/Love Scene",
      "Tunnel Chase",
      "Death By Fire/Terminator Gets Up",
      "Factory Chase",
      "Reese's Death/Terminator Sits Up/'You're Terminated!'",
      "Sarah's Destiny/The Coming Storm"
    ]
  },
  {
    title: "Conan the Barbarian",
    category: "Movie",
    artist: "Basil Poledouris",
    year: 1982,
    tracks: [
      "Prologue / Anvil of Crom",
      "Riddle of Steel / Riders of Doom",
      "The Gift of Fury",
      "Column of Sadness / Wheel of Pain",
      "Atlantean Sword",
      "Theology / Civilization",
      "Love Theme",
      "The Search",
      "The Orgy",
      "The Funeral Pyre",
      "Battle of the Mounds, Part 1",
      "Orphans of Doom / The Awakening"
    ]
  },
  {
    title: "Twin Peaks",
    category: "Television",
    artist: "Angelo Badalamenti",
    year: 1990,
    tracks: [
      "Twin Peaks Theme",
      "Laura Palmer's Theme",
      "Audrey's Dance",
      "The Nightingale",
      "Freshly Squeezed",
      "The Bookhouse Boys",
      "Into the Night",
      "Night Life in Twin Peaks",
      "Dance of the Dream Man",
      "Love Theme from Twin Peaks",
      "Falling"
    ]
  },
  {
    title: "The Legend of Zelda: Ocarina of Time (US Edition)",
    category: "Videogame",
    artist: "Koji Kondo",
    year: 1998,
    tracks: [
      "Title Theme",
      "Deku Tree",
      "Fairy Flying",
      "House",
      "Kokiri Forest",
      "Shop",
      "Battle",
      "Inside the Deku Tree",
      "Boss Battle",
      "Hyrule Field Main Theme",
      "Market",
      "Hyrule Castle Courtyard",
      "Ocarina Songs",
      "Ocarina of Time",
      "LonLon Ranch",
      "Kakariko Village",
      "Lost Woods",
      "Zora's Domain",
      "Great Fairy's Fountain",
      "Temple of Time",
      "Chamber of the Sages",
      "Horse Race",
      "Kakariko Village Orchestra",
      "Windmill Hut",
      "Gerudo Valley",
      "Ganondorf Battle",
      "Last Battle",
      "Zelda's Lullaby",
      "Staff Credits Theme",
      "Minuet of Forest",
      "Bolero of Fire",
      "Serenade of Water",
      "Nocturne of Shadow",
      "Prelude of Light",
      "Requiem of Spirit"
    ]
  }
]

column_titles = [
  "Track",
  "Album",
  "Artist",
  "Year",
  "Category"
]

# Write your code below!
require 'pry'
require 'csv'

CSV.open("all_the_songs.csv", "w") do |csv|
  csv << column_titles
  ALBUMS.each do |album|
    album[:tracks].each do |track|
      csv << [track, album[:title], album[:artist], album[:year], album[:category]]
    end
  end

  CSV.foreach("some_songs.csv", headers: true, col_sep: "\t") do |row|
    # 'row' is a CSV::Row - it acts like a hash
    csv << [row["Track"], row["Album"], row["Artist"], row["Year"], row["Category"]]
  end

end
