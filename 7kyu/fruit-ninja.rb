# Description
# You are a Fruit Ninja, your skill is cutting fruit. All the fruit will be cut in half by your knife. For example:

# [  "apple",     "pear",     "banana"  ]  --> ["app", "le", "pe", "ar", "ban", "ana"]
# As you see, all fruits are cut in half. You should pay attention to "apple": if you cannot cut a fruit into equal parts, then the first part will has a extra character.

# You should only cut the fruit, other things should not be cut, such as the "bomb":

# [  "apple",     "pear",     "banana",   "bomb"]  -->
# ["app", "le", "pe", "ar", "ban", "ana", "bomb"]
# The valid fruit names are preloded for you as:

# $fruits_name
# Task
# Complete function cut_fruits that accepts argument fruits. Returns the result in accordance with the rules above.
def cut_fruits(fruits)
  # code here...
  fruits.map do | n |
  if $fruits_name.include?(n)
    if n.length.even?
      then n.chars.each_slice(n.length/2).map(&:join)
    else
      n.chars.each_slice(n.length/2 + 1).map(&:join)
    end
  else n
  end
  end.flatten
end
