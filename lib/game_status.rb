# Helper Method
require "pry"
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
]


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
        return combo
    end
  end
end



#  actual solution

# def won?(board)
#   WIN_COMBINATIONS.detect do |combo|
#     board[combo[0]] == board[combo[1]] &&
#     board[combo[1]] == board[combo[2]] &&
#     position_taken?(board, combo[0])
#   end
# end


# def won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    win_index_1 = combo[0]
#    win_index_2 = combo[1]
#    win_index_3 = combo[2]
#
#    position_1 = board[win_index_1]
#    position_2 = board[win_index_2]
#    position_3 = board[win_index_3]
#
#    if position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_1)
#      return combo
#
#
#     end
#   end
# end

def full?(board)
  board.all? do |space|
     space == "X" || space == "O"
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) == true
    return true
  end
end

 def over?(board)
   if draw?(board) || won?(board)
     return true
   end
  end

  def winner(board)

    if won?(board)
      won?(board).detect do |symbol|
        if board[symbol] == "X" || board[symbol] == "O"
          return board[symbol]
      end
    end
  end
end


board = ["X","X","X","O"]

winner(board)
