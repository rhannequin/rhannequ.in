# frozen_string_literal: true

module Caelus
  module NumberHelper
    def format_number(number, precision: 2, unit: nil)
      formatted_number = format("%.#{precision}f", number)
      formatted_number += " #{unit}" if unit
      formatted_number
    end
  end
end
