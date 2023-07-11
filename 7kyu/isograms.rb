# DESCRIPTION:
# An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a function that determines whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.

# Example: (Input --> Output)

# "Dermatoglyphics" --> true "aba" --> false "moOse" --> false (ignore letter case)

# isIsogram "Dermatoglyphics" = true
# isIsogram "moose" = false
# isIsogram "aba" = false

def is_isogram(string)
  #your code here
  new_array = string.downcase.split("").map do |letter|
    string.downcase.count(letter)
  end

  new_array.uniq.size == 1 or new_array==[]
end

# Other solutions
def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end
