# frozen_string_literal: true

module Display
  EMPTY_CELL = "\u25cb"
  FILLED_CELL = "\u25cf"
  TOP_LINE = "\u250c#{"\u2500" * 27}\u2510\n"
  BOTTOM_LINE = "\u2514#{"\u2500" * 27}\u2518\n"
  COLUMN_NUMBERS = '  0   1   2   3   4   5   6'
  VERTICAL_LINE = "\u2502"
end
