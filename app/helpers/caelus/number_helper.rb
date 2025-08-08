# frozen_string_literal: true

module Caelus
  module NumberHelper
    def format_number(number, precision: 2, unit: nil)
      formatted_number = format("%.#{precision}f", number)
      if unit
        if [:au, :kmps].include?(unit)
          unit_str_key = {au: "astronomical_unit", kmps: "kilometers_per_second"}[unit]
          formatted_number += " #{I18n.t("caelus.units.#{unit_str_key}.symbol")}"
        end
      end
      formatted_number
    end
  end
end
