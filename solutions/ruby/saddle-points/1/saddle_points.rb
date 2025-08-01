module Grid
  def self.saddle_points(input)
    rows = input
    cols = input.transpose
    saddle_points = []

    rows.each.with_index do |row, row_index|
      row.each.with_index do |row_val, column_index|
        col_val = cols[column_index][row_index]
        if row_val == row.max && col_val == cols[column_index].min
          saddle_points << { "row" => row_index + 1, "column" => column_index + 1 }
        end
      end
    end
    saddle_points
  end
end

