# Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
# The Sudoku board could be partially filled,
# where empty cells are filled with the character '.'.
# A valid Sudoku board (partially filled) is not necessarily solvable.
# Only the filled cells need to be validated.

#####################

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  SudokuBoard.new(board).valid?
end

class SudokuBoard
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def valid?
    valid_rows? && valid_cols? && valid_squares?
  end

  private

  def valid_rows?
    board.all? { |row| valid_group?(row) }
  end

  def valid_cols?
    (0...board.length).all? do |col_index|
      col = board.map { |row| row[col_index] }
      valid_group?(col)
    end
  end

  def valid_squares?
    squares = []
    board.each_slice(3).each do |row_group|
      (0...board.length).step(3).each do |i|
        squares << row_group.map { |row| row[i, 3] }.flatten
      end
    end
    squares.all? { |square| valid_group?(square) }
  end

  def valid_group?(group)
    no_blanks = group - ['.']
    return false if no_blanks.uniq.length != no_blanks.length || group.length != 9
    no_blanks.all? { |cell| ('1'..'9').cover?(cell) }
  end
end
