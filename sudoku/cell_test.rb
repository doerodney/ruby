require 'minitest/autorun'
require './cell'

class CellTest < Minitest::Test
    def setup
      @cell = Cell.new(3,4,5)
      @nil_cell = Cell.new(0,0, nil)
    end

    def test_cell
      assert_equal 3, @cell.row
      assert_equal 4, @cell.column
      assert_equal 5, @cell.value
    end

    def test_nil_value_cell
      assert_nil @nil_cell.value
    end
end