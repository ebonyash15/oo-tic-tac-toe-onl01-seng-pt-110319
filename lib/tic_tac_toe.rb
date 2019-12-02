class TicTacToe
  def initialize(board=Array.new(9," "))
    @board = board
  end
  WIN_COMBINATIONS=[
    [0,1,2],[3,4,5],[6,7,8],
    [0,4,8],[6,4,2],[0,3,6],
    [1,4,7],[2,5,8]]
  def display_board
    line="\n-----------\n"
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} #{line} #{@board[3]} | #{@board[4]} | #{@board[5]} #{line} #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end
  def input_to_index(input)
    input.to_i-1
  end
  def move(index,token="X")
    @board[index]=token
  end
  def position_taken?(position)
    (@board[position] == "X")||(@board[position]=="O")
  end
  def valid_move?(position)
    position.between?(0,8) && !self.position_taken?(position)
  end
  def turn_count
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
       turns +=1
      end
    end
    turns
  end
  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end
  def turn
      puts "Please enter a number between 1 and 9:"
      player_input = gets.strip
      index=self.input_to_index(player_input)
      token= current_player
    if self.valid_move?(index)
      self.move(index,token)
      self.display_board
    else
      puts "Invalid move, please select another number between 1 and 9:"
      self.turn
    end
  end
  def won?
    WIN_COMBINATIONS.find do |winning_combo|
      if (@board[winning_combo[0]])==("X")&&
        (@board[winning_combo[1]])==("X")&&
        (@board[winning_combo[2]])==("X")
        return winning_combo
      elsif (@board[winning_combo[0]])==("O")&&
        (@board[winning_combo[1]])==("O")&&
        (@board[winning_combo[2]])==("O")
        return winning_combo
      else
        false
      end
    end
  end
  def full?
    true if !@board.include?(" ")
  end
  def draw?
    if !self.won? && self.full?
    true
    end
  end
  def over?
    true if self.won? || self.full? || self.draw?
  end
  def winner
    if !self.won?
      return nil
    else
      array=self.won?.to_a
      @board[array[0]]
    end
  end
  def play
    unitl self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat\'s Game!"
    end
  end
end
