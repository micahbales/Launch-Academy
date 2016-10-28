def guess_number(min, max)

  while min <= max

    middle = (max + min) / 2
    guess = check(middle)

    if guess == 1
      max = middle - 1
    elsif guess == -1
      min = middle + 1
    else
      return middle
    end
  end
end
