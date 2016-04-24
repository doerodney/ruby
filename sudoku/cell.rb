class Cell
    attr_reader :column, :row, :value
	
	def initialize(row, column, value = nil)
		@row = row
		@column = column
		@value = value
	end

end
