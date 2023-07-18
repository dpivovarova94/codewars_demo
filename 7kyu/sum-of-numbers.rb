# DESCRIPTION:
# Given two integers a and b, which can be positive or negative, find the sum of all the integers between and including them and return it. If the two numbers are equal return a or b.

# Note: a and b are not ordered!

# Examples (a, b) --> output (explanation)
# (1, 0) --> 1 (1 + 0 = 1)
# (1, 2) --> 3 (1 + 2 = 3)
# (0, 1) --> 1 (0 + 1 = 1)
# (1, 1) --> 1 (1 since both are same)
# (-1, 0) --> -1 (-1 + 0 = -1)
# (-1, 2) --> 2 (-1 + 0 + 1 + 2 = 2)
# Your function should only return a number, not the explanation about how you get that number.

def get_sum(a,b)
  # Good Luck!
  num = 0
  if a < b then
    for i in a..b
        num += i
    end
  return num
  elsif a > b then
    for i in b..a
        num += i
    end
  return num
  else
    return a
  end
end

# Other solution
# def get_sum(a,b)
#   return a < b ? (a..b).reduce(:+) : (b..a).reduce(:+)
# end
