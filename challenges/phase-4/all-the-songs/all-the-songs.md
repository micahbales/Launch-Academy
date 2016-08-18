## Introduction

You have just learned all about **file I/O** and **CSV files**, so you decide to put this new knowledge to work, freelance a little bit, and make some money!

Your very first client has a small collection of their favorite albums that they want **parsed** and **stored in a file**.

(They're a paying client, so you don't ask _why_ they want such a seemingly useless file.)

You decide now is a **perfect** chance to use Ruby's **CSV** library!

## Learning Goals

- Navigate compound data structures
- Write data to a CSV file
- Read data from a CSV file, line by line
- Understand headers and column separators

## Part 1: Writing to CSV

As part of this questionably useful contract, you've received an `ALBUMS` array.
Each element is a hash representing an album containing the following information:

- Title
- Category
- Artist
- Year
- Tracks

The `tracks` themselves are an array nested within the hash.
For an unspecified reason, you are supposed to populate the `all_the_songs.csv` file with a **list of all of the tracks** organized by album.

Your first step is to include the CSV library, since Ruby doesn't load it by default.

```ruby
require "csv"
```

Then you decide that each row should be organized as:

```no-highlight
track, album, artist, year, category
```

When it comes to writing, you wisely decide to use `CSV.open`.
This useful method takes a **filename** as well as a **mode** to open in (per the [docs][csv-docs]):

- `"r"`: Read-only, starts at beginning of file  (default mode).
- `"r+"`:  Read-write, starts at beginning of file.
- `"w"`:  Write-only, truncates existing file to zero length or creates a new file for writing.
- `"w+"`: Read-write, truncates existing file to zero length or creates a new file for reading and writing.
- `"a"`:  Write-only, each write call appends data at end of file. Creates a new file for writing if file does not exist.
- `"a+"`: Read-write, each write call appends data at end of file. Creates a new file for reading and writing if file does not exist.

> **Note:** The difference between `r+` and `w+` is subtle, but important. They both begin writing at the beginning of the file, but `w+` will _clear_ an existing file before writing, whereas `r+` will only overwrite as many lines of data as you pass in.

The append modes `"a"` and `"a+"` are useful when **adding data** to a file.
In this situation, however, you're **writing the file** from scratch so you choose the `"w"` mode.
This will **clear** any data in the file first, as well as allow you to run your code several times without adding duplicate data to the file.

```ruby
require "csv"

CSV.open("all_the_songs.csv", "w") do |csv|
  # Write the song titles
end
```

> **Note for Windows:** You should add `"b"` to the end of the mode (e.g. `"wb"`), as this will prevent Windows from converting **end of line** characters to an improper format.

Now that you have the file open for **writing** only, you decide to iterate through the `ALBUMS`.
You remember that you can use the `<<` operator to push a row of data to the `csv` file.
The operator expects the information to be ordered inside an **array**:

```ruby
csv << [track, album, artist, year, category]
```

> **Hint:** You need to iterate through **both** `ALBUMS` **and** each album's `tracks` to write to the file.

{% show_solution %}
```ruby
require "csv"

CSV.open("all_the_songs.csv", "w") do |csv|

  ALBUMS.each do |album|
    album[:tracks].each do |track|
      csv << [track, album[:title], album[:artist], album[:year], album[:category]]
    end
  end

end
```
{% endshow_solution %}

## Part 2: Headers

You've successfully written `all_the_songs.csv`.
Being a _detail-oriented developer_, you open it up to verify everything is there when you discover that it's actually _very difficult_ to read.
Your client might not know what all of the different columns represent!

```no-highlight
Firefly - Main Title,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
Big Bar Fight,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
Heart of Gold Montage,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
Whitefall / Book,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
Early Takes Serenity,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
...
```

You decide to add **headers** (column titles) to the file, so that anyone else reading the file can understand what all of the columns are.

```ruby
column_titles = [
  "Track",
  "Album",
  "Artist",
  "Year",
  "Category"
]
```

Headers are nothing more than a **row of column titles** in the first line of a file, so you add them easily to the `csv` with `<<` before iterating through `ALBUMS`.

{% show_solution %}
```ruby
require "csv"

column_titles = [
  "Track",
  "Album",
  "Artist",
  "Year",
  "Category"
]

CSV.open("all_the_songs.csv", "w") do |csv|

  csv << column_titles

  ALBUMS.each do |album|
    album[:tracks].each do |track|
      csv << [track, album[:title], album[:artist], album[:year], album[:category]]
    end
  end

end
```
{% endshow_solution %}

The file is _still_ a little difficult to read, but CSVs are meant more for computers than humans anyways. You **correctly appreciate** that the headers at least make the data a _little_ clearer.

```no-highlight
Track,Album,Artist,Year,Category
Firefly - Main Title,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
Big Bar Fight,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
Heart of Gold Montage,Firefly (Original Soundtrack),Greg Edmonson,2005,Television
...
```

## Part 3: Reading Files

You're all done!

Time to bust out your favorite movie soundtrack and dance!

Wait...
All of a sudden, you feel a chill as you realize that this project had some **[scope creep][scope-creep]**, an all-too-common occurrence for independent contractors like yourself.
In an email to your client, you _unintentionally (and rather unfortunately)_ agreed to add code that would read an **existing** CSV of albums and _add_ those to the one you're creating from `ALBUMS`.

They're a paying client, and technically you agreed (in a loose legal sense), so you wisely (but painfully) don't berate them for storing their data in two different locations and formats.

Instead, you crack your knuckles and write some **really killer code**!

You immediately remember that you **should never** use `CSV.read` (or `CSV.readlines`) because those methods would load _the entire file into memory at once_.
Instead, you wisely choose `.foreach` to only read a single line into memory at once.

And because this file _somehow conveniently_ has the same column titles, you can use the `headers: true` option.
By including this, `CSV.foreach` will turn `row` into a much more useful object.

Rather than an `Array`, the `row` now represents a `CSV::Row`, which lets you access a piece of information **by its column name** rather than having to know its position in the array.
You decide to output the track titles to the screen, just to verify everything loads properly.

```ruby
CSV.foreach("some_songs.csv") do |row|
  # 'row' is an array
  puts row[0]
end

CSV.foreach("some_songs.csv", headers: true) do |row|
  # 'row' is a CSV::Row - it acts like a hash
  puts row["Track"]
end
```

_Uh-oh!_ Nothing shows up when you run your file with `ruby code.rb`! You know on a visceral level that **nothing at all can possibly be wrong** with your work, so you suspect `some_songs.csv` to be the culprit.

```no-highlight
Track	Album	Artist	Year	Category
Somewhat Damaged	The Fragile, Disc 1	Nine Inch Nails	1999	Music
The Day the World Went Away	The Fragile, Disc 1	Nine Inch Nails	1999	Music
The Frail	The Fragile, Disc 1	Nine Inch Nails	1999	Music
The Wretched	The Fragile, Disc 1	Nine Inch Nails	1999	Music
We're in This Together	The Fragile, Disc 1	Nine Inch Nails	1999	Music
...
```

_Voila!_ You realize that whoever made this file **did not** use commas to delineate the different columns. Rather, since some of the album names include `","` in them, the file uses **tabs** to separate the data<sup>1</sup>.
As a result, reading it as a CSV processed neither the headers _nor_ the rows properly!

> <sup>1</sup> You notice that the song "Battle of the Mounds, Part 1" from the soundtrack to **Conan the Barbarian** (in `ALBUMS`) has a comma in the name, but it still works when you export to a CSV. The intelligent CSV library knows that it represents a single value and wraps it in `"..."` within the CSV file. Thus, because the comma is _inside the quotation marks_, it **is not** considered to be a separator when read back in.

## Part 4: Column Separators

You recognize that this is technically a **"tab-separated value"** file (TSV) despite the file extension, but thankfully Ruby's CSV library can handle _any_ delimiter, not just commas or tabs.

Being a [_document-reading developer_](http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html), you know that all you have to do is add the `:col_sep` option to specify _what characters_ separate the columns.
(In this case, to specify a 'tab' you use the escape sequence `"\t"`.)

```ruby
CSV.foreach("some_songs.csv", headers: true, col_sep: "\t") do |row|
  puts row["Track"]
end
```

And it works!
At this point, all you have left is to read the albums and export them to `all_the_songs.csv`.

> You make the decision to continue using commas to delineate the data, rather than tabs, as these album names will be wrapped in quotation marks in the final file, allowing them to be read as a single value.

{% show_solution %}
```ruby
require "csv"

column_titles = [
  "Track",
  "Album",
  "Artist",
  "Year",
  "Category"
]

CSV.open("all_the_songs.csv", "w") do |csv|

  csv << column_titles

  ALBUMS.each do |album|
    album[:tracks].each do |track|
      csv << [track, album[:title], album[:artist], album[:year], album[:category]]
    end
  end

  CSV.foreach("some_songs.csv", headers: true, col_sep: "\t") do |row|
    csv << [row["Track"], row["Album"], row["Artist"], row["Year"], row["Category"]]
  end
end
```
{% endshow_solution %}

## Summary

Appropriately proud of both yourself and your code, you submit the work to your client and they express their gratitude by cutting you the fattest of checks.

In the process, you reiterated your understanding of:

1. Iterating through **compound data structures**
2. **Writing** to a CSV file
3. **Reading** from a CSV file
4. Using **headers** to better work with data
5. Applying **column separators** to organize data

Both your bank account _and_ development skills are now richer in the process, so all is right with the world!

[csv-docs]: http://ruby-doc.org/core-2.0.0/IO.html#method-c-new-label-IO+Open+Mode
[scope-creep]: https://en.wikipedia.org/wiki/Scope_creep
