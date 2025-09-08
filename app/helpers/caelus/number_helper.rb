# frozen_string_literal: true

module Caelus
  module NumberHelper
    SUPPORTED_UNITS = {
      arcminute: "arcminute",
      au: "astronomical_unit",
      day: "day",
      degree: "degree",
      km: "kilometer",
      kmps: "km_per_second",
      mps2: "m_per_second_squared"
    }.freeze

    def format_number(number, precision: nil, unit: nil)
      formatted_number = if precision.nil?
        ActiveSupport::NumberHelper.number_to_delimited(number.round.to_i)
      else
        ActiveSupport::NumberHelper
          .number_to_delimited(sprintf("%.#{precision}f", number))
      end

      if SUPPORTED_UNITS.key?(unit)
        unit_str_key = SUPPORTED_UNITS[unit]
        formatted_number += I18n.t("caelus.units.#{unit_str_key}.symbol")
      end
      formatted_number
    end
  end
end
