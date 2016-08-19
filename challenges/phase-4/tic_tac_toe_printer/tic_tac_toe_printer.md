In between geometry classes, Mrs. Fisher is an avid Tic Tac Toe fan!
While most students don't know this, she's trusted you with this information
because she needs your help. In the past, someone built a tic tac toe game for her.
Unfortunately, the original developer left out one important element: the ability to print the grid.

Build a method `print_grid` that takes a single argument `board`.
This argument should be a two dimensional array that represents the rows and columns of the tic tac toe board.
Mrs. Fisher has provides some sample data to help.

```ruby
board_a = [
  ['x', 'o', 'x'],
  ['x', nil, 'o'],
  ['x', 'o', nil]
]
```

Sample output of the `print_grid` method for `board_a` above.

```no-highlight
 x | o | x
-----------
 x |   | o
-----------
 x | o |  
```

```ruby
board_b = [
  [nil, 'o', 'x'],
  ['x', 'o', nil],
  ['x', 'o', nil]
]
```

Sample output to the `print_grid` method for `board_b` above.

```no-highlight
   | o | x
-----------
 x | o |
-----------
 x | o |
```

Implement the method using the `each_with_index` method of `Array`.

