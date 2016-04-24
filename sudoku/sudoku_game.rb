class SudokuGame
  def initialize(order, initial_values)
    @cell_list = []
    for row in 0.upto(order) do
      for column in 0.upto(order) do
        @cell_list.collect(nil)
      end
    end
    @cell_list
  end
end