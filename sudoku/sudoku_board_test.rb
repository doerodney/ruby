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
    assert_equal(4, @default_board.count_rows)
    assert_equal(4, @default_board.count_columns)
    assert_equal(2, @default_board.order)
    assert_equal([1,2,3,4].to_set, @default_board.full_set)
    assert_equal(0, @default_board.cell_index(0,0), 0)
    assert_equal(15, @default_board.cell_index(3,3), 15)
    assert_equal([1, nil, nil, 2], @default_board.column_values(0))
    assert_equal([1, 2], @default_board.defined_column_values(0))

    assert_equal(0, @default_board.region(0,0))
    assert_equal(0, @default_board.region(0,1))
    assert_equal(0, @default_board.region(1,0))
    assert_equal(0, @default_board.region(1,1))

    assert_equal(3, @default_board.region(2,2))
    assert_equal(3, @default_board.region(2,3))
    assert_equal(3, @default_board.region(3,2))
    assert_equal(3, @default_board.region(3,3))

    assert_equal([0,1,4,5], @default_board.region_cell_indices(0))
    assert_equal([2,3,6,7], @default_board.region_cell_indices(1))
    assert_equal([8,9,12,13], @default_board.region_cell_indices(2))
    assert_equal([10,11,14,15], @default_board.region_cell_indices(3))
  end

  def test_defined_board
    assert_equal(9, @defined_board.count_rows)
    assert_equal(9, @defined_board.count_columns)
    assert_equal(3, @defined_board.order)
    assert_equal([1,2,3,4,5,6,7,8,9].to_set, @defined_board.full_set)

    assert_equal(0, @defined_board.cell_index(0,0))
    assert_equal(18, @defined_board.cell_index(2,0))
    assert_equal(80, @defined_board.cell_index(8,8))

    assert_equal([1,2,7], @defined_board.defined_column_values(0))
    assert_equal([1,2,7].to_set, @defined_board.column_set(0))
    assert_equal([2,9], @defined_board.defined_column_values(8))
    assert_equal([1,2], @defined_board.defined_row_values(0))
    assert_equal([1,2].to_set, @defined_board.row_set(0))

    assert_equal(0, @defined_board.region(0,0))
    assert_equal(0, @defined_board.region(0,1))
    assert_equal(0, @defined_board.region(0,2))
    assert_equal(0, @defined_board.region(1,0))
    assert_equal(0, @defined_board.region(1,1))
    assert_equal(0, @defined_board.region(1,2))
    assert_equal(0, @defined_board.region(2,0))
    assert_equal(0, @defined_board.region(2,1))
    assert_equal(0, @defined_board.region(2,2))

    assert_equal(8, @defined_board.region(6,6))
    assert_equal(8, @defined_board.region(6,7))
    assert_equal(8, @defined_board.region(6,8))
    assert_equal(8, @defined_board.region(7,6))
    assert_equal(8, @defined_board.region(7,7))
    assert_equal(8, @defined_board.region(7,8))
    assert_equal(8, @defined_board.region(8,6))
    assert_equal(8, @defined_board.region(8,7))
    assert_equal(8, @defined_board.region(8,8))


  end

  def test_column_values
    column = 0
    values = @default_board.column_values(column)
    assert_equal([1, nil, nil, 2], values)
  end

  def test_defined_column_values
    column = 0
    values = @default_board.defined_column_values(column)
    assert_equal([1, 2], values)
  end

  def test_new
    assert_equal([0,1,2,9,10,11,18,19,20], @defined_board.region_cell_indices(0))
    assert_equal([60,61,62,69,70,71,78,79,80], @defined_board.region_cell_indices(8))
    assert_equal( [1,2,3,7].to_set, @defined_board.region_set(0))
  end

end