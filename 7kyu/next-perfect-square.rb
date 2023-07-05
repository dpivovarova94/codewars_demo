# DESCRIPTION:
# You might know some pretty large perfect squares. But what about the NEXT one?

# Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.

# If the parameter is itself not a perfect square then -1 should be returned. You may assume the parameter is non-negative.

# Examples:(Input --> Output)

# 121 --> 144
# 625 --> 676
# 114 --> -1 since 114 is not a perfect square

# My solution
def find_next_square(sq)
  i = sq+1
  # Return the next square if sq is a perfect square, -1 otherwise
  if Math.sqrt(sq) % 1 == 0
    while true
      if Math.sqrt(i) % 1 == 0
        return i
        break
      else
        i += 1
      end
    end
  else
    return -1
  end
end

# Other solution
def find_next_square(sq)
  # Return the next square if sq is a perfect square, -1 otherwise
  number = Math.sqrt(sq) + 1
  number % 1 == 0 ? number**2 : -1
end
