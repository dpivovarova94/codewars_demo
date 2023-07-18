# DESCRIPTION:
# Rock Paper Scissors
# Let's play! You have to return which player won! In case of a draw return Draw!.

# Examples(Input1, Input2 --> Output):

# "scissors", "paper" --> "Player 1 won!"
# "scissors", "rock" --> "Player 2 won!"
# "paper", "paper" --> "Draw!"

def rps(p1, p2)
  #your code here
  if p1 == p2 then
    "Draw!"
  elsif p1 == "scissors"
    if p2 == "paper" then
      return "Player 1 won!"
    elsif p2 =="rock" then
      return "Player 2 won!"
    end
  elsif p1 == "rock"
    if p2 == "scissors" then
      return "Player 1 won!"
    elsif p2 == "paper" then
      return "Player 2 won!"
    end
  elsif p1 == "paper"
    if p2 == "rock" then
      return "Player 1 won!"
    elsif p2 == "scissors" then
      return "Player 2 won!"
    end
  end
end

# Other solution
def rps(p1, p2)
  return 'Player 1 won!' if p1 == 'scissors' && p2 == 'paper'
  return 'Player 1 won!' if p1 == 'paper' && p2 == 'rock'
  return 'Player 1 won!' if p1 == 'rock' && p2 == 'scissors'
  return 'Draw!' if p1 == p2
  'Player 2 won!'
end
