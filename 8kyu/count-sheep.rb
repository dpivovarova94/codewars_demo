# DESCRIPTION:
# If you can't sleep, just count sheep!!

# Task:
# Given a non-negative integer, 3 for example, return a string with a murmur: "1 sheep...2 sheep...3 sheep...". Input will always be valid, i.e. no negative integers.

def count_sheep(num)
  # good luck
  my_string = ""
    for i in (1..(num))
      my_string = my_string + "#{i} sheep..."
    end
  p my_string
end

count_sheep(2)
count_sheep(0)

# Other Solution
# def count_sheep(num)
#   (1..num).map {|i| "#{i} sheep..."}.join
# end
