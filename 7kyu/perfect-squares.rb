# DESCRIPTION:
# Given an integer, if the length of it's digits is a perfect square, return a square block of sqroot(length) * sqroot(length). If not, simply return "Not a perfect square!".

# Examples:

# 1212 returns:

# 12
# 12

# Note: 4 digits so 2 squared (2x2 perfect square). 2 digits on each line.

# 123123123 returns:

# 123
# 123
# 123

# Note: 9 digits so 3 squared (3x3 perfect square). 3 digits on each line.

def square_it(digits)
  #your code here
  if Math.sqrt(digits.to_s.length) % 1 == 0
    my_string = digits.to_s.chars.each_slice(Math.sqrt(digits.to_s.length)).map(&:join)
    p my_string.join("\n")
  else
    "Not a perfect square!"
  end
end

square_it(1212)

# Learning
# chars return an array of characters in string, from "1212" to ["1", "2", "1", "2"]
