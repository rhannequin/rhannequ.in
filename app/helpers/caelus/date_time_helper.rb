# frozen_string_literal: true

module Caelus
  module DateTimeHelper
    def nillable_datetime(datetime, format: :default)
      if datetime.nil?
        "∅"
      else
        I18n.l(datetime, format: format)
      end
    end
  end
end
