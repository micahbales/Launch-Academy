transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
puts transactions.first
# * What is the value of the second transaction?
puts transactions[1]
# * What is the value of the fourth transaction?
puts transactions[3]
# * What is the value of the last transaction?
puts transactions.last
# * What is the value of the second from last transaction?
puts transactions[-2]
# * What is the value of the 5th from last transaction?
puts transactions [-5]
# * What is the value of the transaction with index 5?
puts transactions[5]
# * How many transactions are there in total?
puts transactions.length
# * How many positive transactions are there in total?
total_transactions = 0
transactions.each do |transaction|
  if transaction >= 0
    total_transactions += 1
  end
end
puts total_transactions
# * How many negative transactions are there in total?
total_transactions = 0
transactions.each do |transaction|
  if transaction < 0
    total_transactions += 1
  end
end
puts total_transactions
# * What is the largest withdrawal?
largest_withdrawal = 0
transactions.each do |transaction|
  if transaction < 0
    if transaction < largest_withdrawal
      largest_withdrawal = transaction
    end
  end
end
puts largest_withdrawal
# * What is the largest deposit?
largest_deposit = 0
transactions.each do |transaction|
  if transaction >= 0
    if transaction > largest_deposit
      largest_deposit = transaction
    end
  end
end
puts largest_deposit
# * What is the small withdrawal?
smallest_withdrawal = -62_000
transactions.each do |transaction|
  if transaction < 0
    if transaction > smallest_withdrawal
      smallest_withdrawal = transaction
    end
  end
end
puts smallest_withdrawal
# * What is the smallest deposit?
smallest_deposit = 50_000
transactions.each do |transaction|
  if transaction >= 0
    if transaction < smallest_deposit
      smallest_deposit = transaction
    end
  end
end
puts smallest_deposit
# * What is the total value of all the transactions?
total_value = 0
transactions.each do |transaction|
  total_value += transaction
end
puts total_value
# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
initial_balance = 239_000
puts "$#{initial_balance + total_value}"

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
puts best_records.length
# * Who are all the artists listed?
best_records.each do |artist, song|
  print artist + ", "
end
puts ""
# * What are all the album names in the hash?
best_records.each do |artist, song|
  print song + ", "
end
puts ""
# * Delete the `Eminem` key-value pair from the list.
best_records.delete("Eminem")
puts best_records.inspect
# * Add your favorite musician and their best album to the list.
best_records["Pantha Du Prince"] = "Shimmers"
puts best_records.inspect
# * Change `Nirvana`'s album to another.
best_records["Nirvana"] = "Another"
puts best_records
# * Is `Nirvana` included in `best_records`?
puts best_records.include?("Nirvana")
# * Is `Soundgarden` included in `best_records`?
puts best_records.include?("Soundgarden")
# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
if !best_records.include?("Soundgarden")
  best_records["Soundgarden"] = "Black Hole Sun"
end
puts best_records
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
short_band_names = []
best_records.each do |band, record|
  if band.length <= 6
    short_band_names << band
  end
end
puts short_band_names
# * Which key-value pairs have a value that is greater than 10 characters?
long_band_names = []
best_records.each do |band, record|
  if band.length > 10
    long_band_names << band
  end
end
puts long_band_names
