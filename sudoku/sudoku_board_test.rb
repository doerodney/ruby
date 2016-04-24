require 'minitest/autorun'
require './sudoku_board'

class SudokuBoardTest < Minitest::Test
  def setup
    @default_board = SudokuBoard.new
    @defined_board = SudokuBoard.new(3, [
          1, nil, nil, nil, nil, nil, nil, nil,   2,
        nil,   2, nil, nil, nil, nil, nil, nil, nil,
          7, nil,   3, nil, nil, nil, nil, nil, nil,
        nil, nil, nil,   4, nil, nil, nil, nil, nil,
          2, nil, nil, nil,   5, nil, nil, nil, nil,
        nil, nil, nil, nil, nil,   6, nil, nil, nil,
        nil, nil, nil, nil, nil, nil,   7, nil, nil,
        nil, nil, nil, nil, nil, nil, nil,   8, nil,
        nil, nil, nil, nil, nil, nil, nil, nil,   9
    ])
  end

  def test_default_board
    assert_equal(@default_board.count_rows, 4)
    assert_equal(@default_board.count_columns, 4)
    assert_equal(@default_board.cell_index(0,0), 0)
    assert_equal(@default_board.cell_index(3,3), 15)
    assert_equal(@default_board.column_values(0), [1, nil, nil, 2])
    assert_equal(@default_board.defined_column_values(0), [1, 2])
  end

  def test_defined_board
    assert_equal(@defined_board.count_rows, 9)
    assert_equal(@defined_board.count_columns, 9)
    assert_equal(@defined_board.order, 3)

    assert_equal(@defined_board.cell_index(0,0), 0)
    assert_equal(@defined_board.cell_index(2,0), 18)
    assert_equal(@defined_board.cell_index(8,8), 80)

    assert_equal(@defined_board.defined_column_values(0), [1,2,7])
    assert_equal(@defined_board.column_set(0), [1,2,7].to_set)
    assert_equal(@defined_board.defined_column_values(8), [2,9])
    assert_equal(@defined_board.column_set(8), [2,9].to_set)

    assert_equal(@defined_board.defined_row_values(0), [1,2])
    assert_equal(@defined_board.row_set(0), [1,2].to_set)
  end

  def test_column_values
    column = 0
    values = @default_board.column_values(column)
    assert_equal(values, [1, nil, nil, 2])
  end

  def test_defined_column_values
    column = 0
    values = @default_board.defined_column_values(column)
    assert_equal(values, [1, 2])
  end

end