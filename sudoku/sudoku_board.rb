require './cell'
require 'set'

class SudokuBoard
  attr_reader :count_columns, :count_rows, :order

  def initialize(order = 2, mtrx = [
      1, 3, 4, 2,
      nil, 2, nil, nil,
      nil, nil, 3, nil,
      2, nil, nil, 4
  ])
    @order = order
    cells_per_side = @order * @order
    @count_columns = cells_per_side
    @count_rows = cells_per_side
    @cells = []
    i = 0
    cells_per_side.times do |row|
      cells_per_side.times do |column|
        value = mtrx[i]
        cell = Cell.new(row, column, value)
        @cells.push(cell)
        i += 1
      end
    end
  end

  def cell_index(row, column)
    idx = row * @count_columns + column
    return idx
  end

  def cell_value(row, column)
    i = cell_index(row, column)
    cell = @cells[i]
    value = cell.value
    return value
  end

  def column_set(column)
    values = defined_column_values(column)
    values.to_set
  end

  def column_values(column)
    values = []
    (0...@count_rows).each do |row|
      value = self.cell_value(row, column)
      values.push(value)
    end

    values
  end

  def defined_column_values(column)
    values = []
    (0...@count_rows).each do |row|
      value = self.cell_value(row, column)
      values.push(value) if not value.nil?
    end

    values.sort
  end

  def row_set(row)
    values = self.defined_row_values(row)
    values.to_set
  end

  def defined_row_values(row)
    values = []
    (0...@count_columns).each do |column|
      value = self.cell_value(row, column)
      values.push(value) if not value.nil?
    end

    values.sort
  end

  def row_values(row)
    values = []
    (0...@count_columns).each do |column|
      value = self.cell_value(row, column)
      values.push(value)
    end

    values
  end

end
