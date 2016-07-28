require './cell'
require 'set'

class SudokuBoard
  attr_reader :count_columns, :count_rows, :full_set, :order

  def initialize(order = 2, mtrx = [
      1, 3, 4, 2,
      nil, 2, nil, nil,
      nil, nil, 3, nil,
      2, nil, nil, 4
  ])
    # Capture board geometry.
    @order = order
    cells_per_side = @order * @order
    @count_columns = cells_per_side
    @count_rows = cells_per_side

    # Calculate the values in a full set (typically 1..9)
    full_set_values = []
    1.upto(cells_per_side).each do |value| full_set_values.push(value) end
    @full_set = full_set_values.to_set

    # Initialize cells and regions.
    @cells = []
    @cell_regions = []

    # Create a hash to map cell indices to a region.
    @region_cell_dict = Hash.new([])
    region = 0
    (0...order).each do |row|
      (0...order).each do |column|
        @region_cell_dict[region] = []
        region += 1
      end
    end

    # Read cell values from the matrix argument.
    i = 0
    cells_per_side.times do |row|
      cells_per_side.times do |column|
        # Create a Cell object and store it in an array.
        value = mtrx[i]
        region = self.region(row, column)
        cell = Cell.new(row, column, value)
        @cells.push(cell)
        @cell_regions.push(region)

        # Store the region of the cell in a hash, since this will
        # be a frequent lookup task.
        # Key = region, Value = array of index values.
        @region_cell_dict[region].push(i)
        # puts "row, column, index, region = #{row}, #{column}, #{i}, #{region}"
        i += 1
      end
    end
  end

  def cell_index(row, column)
    idx = row * @count_columns + column
    return idx
  end

  def cell_region(row,column)
    i = cell_index(row, column)
    region = @cell_regions[i]
    region
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

  def region(row, column)
    region = column/@order + @order * (row/@order)

    region
  end

  def region_cell_indices(region)
    indices = @region_cell_dict[region]
    indices
  end

  def region_set(region)
    values = []
    indices = @region_cell_dict[region]
    indices.each do |i|
      cell = @cells[i]
      value = cell.value
      unless value.nil?
        values.push(value)
      end
    end

    values.to_set
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
