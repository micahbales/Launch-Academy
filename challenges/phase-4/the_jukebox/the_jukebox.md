There's a classic jukebox at this diner, and you're dying to put together a
playlist.

As you approach the jukebox, you realize that this isn't your ordinary music playing machine!
There's a computer attached to it, and a sign above it that states "No coins,
just Ruby instances, please."

You think, "Wow, I guess software really is [eating the
world][eating-the-world]!"

### Part I - Model Your Playlist

Your `Playlist` constructor should require a list of song names. Like any good
jukebox, you're limited to a certain set of songs. Your constructor should
eliminate any songs that are not on the following list:

```no-highlight
Hello - Lionel Ritchie
Kokomo – The Beach Boys
Girl You Know It’s True – Milli Vanilli
Agadoo – Black Lace
Down Under - Men at Work
Nothing's Gonna Stop Us Now - Starship
Get Outta My Dreams, Get Into My Car - Billy Ocean
I Just Called To Say I Love You - Stevie Wonder
Hangin' Tough - New Kids on the Block
We Built This City - Starship
Wake Me Up Before You Go Go - Wham!
We Didn't Start The Fire - Billy Joel
I Wanna Dance With Somebody - Whitney Houston
U Can't Touch This - MC Hammer
```

Because the Jukebox cannot play other songs, songs not in the list should just
be removed.

### Part II - Shuffle Your Playlist

Implement a `shuffle!` method that randomizes the order of your playlist

### Part III - Make Sweet Music

Implement a `play!` instance method that takes the first song on the list and removes it
from the playlist permanently. The playing song should be returned.

### Part IV - Add to Your Playlist

Implement an `add_track` instance method that requires one argument, the name of
the track. If the song is in list of available songs, your software should add
the song the the end of the playlist and return `true`. If the song is not found on
the list, it should just return `false`.

[eating-the-world]: http://www.wsj.com/articles/SB10001424053111903480904576512250915629460


{% show_solution %}
```ruby
class Playlist
  attr_accessor :playlist

  SONG_LIST = [
    "Hello - Lionel Ritchie",
    "Kokomo – The Beach Boys",
    "Girl You Know It’s True – Milli Vanilli",
    "Agadoo – Black Lace",
    "Down Under - Men at Work",
    "Nothing's Gonna Stop Us Now - Starship",
    "Get Outta My Dreams, Get Into My Car - Billy Ocean",
    "I Just Called To Say I Love You - Stevie Wonder",
    "Hangin' Tough - New Kids on the Block",
    "We Built This City - Starship",
    "Wake Me Up Before You Go Go - Wham!",
    "We Didn't Start The Fire - Billy Joel",
    "I Wanna Dance With Somebody - Whitney Houston",
    "U Can't Touch This - MC Hammer"
  ]

  def initialize(user_list)
    @playlist = []
    user_list.each do |song|
      if SONG_LIST.include?(song)
        @playlist << song
      end
    end
  end

  def shuffle!
    @playlist.shuffle!
  end

  def play!
    @playlist.shift
  end

  def add_track(new_song)
    @playlist << new_song if SONG_LIST.include?(new_song)
    SONG_LIST.include?(new_song)
  end

  def to_s
    @playlist.join("\n")
  end
end
```
{% endshow_solution %}
