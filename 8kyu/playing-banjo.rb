# Create a function which answers the question "Are you playing banjo?".
# If your name starts with the letter "R" or lower case "r", you are playing banjo!

# The function takes a name as its only argument, and returns one of the following strings:

# name + " plays banjo"
# name + " does not play banjo"
# Names given are always valid strings

def are_you_playing_banjo(name)
  # Implement me!
  if name.downcase[0] == "r"
    return name + " plays banjo"
  else
    return name + " does not play banjo"
  end
end

# Other solution
def are_you_playing_banjo(name)
  name[0].downcase == "r" ? "#{name} plays banjo" : "#{name} does not play banjo"
end
