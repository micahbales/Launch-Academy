It's your first day at the links!
In the great game of golf, you must be careful to select the right club based on the distance you are from the hole.

Your golf coach has given you the following table,
which represents the club you should use based on your distance from the hole, in yards.

```no-highlight
driver 200
four wood 180
five wood 170
two iron 170
three iron 160
four iron 150
five iron 140
six iron 130
seven iron 120
eight iron 110
nine iron 95
pitching wedge 80
sand Wedge 20
putter 0
```

Using this table, and your current distance from the hole, you can determine what club to hit.
The yardage represented in the table is the lowest distance you will hit using that club.
For example, if you are 85 yards from the hole, you should use a pitching wedge.
If you use a Sand Wedge, your shot will not be long enough.
If you use a 9 iron, you will shoot over the hole and potentially into the woods.
As another example, if you are 168 yards from the hole, you should shoot a 3 iron to ensure the closest shot.

Write a program, given a user-supplied distance, that tells you which club you should use.

Example Output:

```no-highlight
How far away are you?
#> 155

Use the four iron!
```

{% show_solution %}
```ruby
distances = {
  driver: 200,
  three_wood: 180,
  five_wood: 170,
  two_iron: 170,
  three_iron: 160,
  four_iron: 150,
  five_iron: 140,
  six_iron: 130,
  seven_iron: 120,
  eight_iron: 110,
  nine_iron: 95,
  pitching_wedge: 80,
  sand_wedge: 20,
  putter: 0
}

puts "How far away are you?"
current_distance = gets.chomp.to_i

distances.each do |club, distance|
  if distance <= current_distance
    puts "Use the #{club.to_s.gsub("_", " ")}!"
    break
  end
end
```
{% endshow_solution %}
