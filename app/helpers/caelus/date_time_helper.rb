# frozen_string_literal: true

module Caelus
  module DateTimeHelper
    def nillable_datetime(datetime, utc_offset: "+00:00", format: :default)
      if datetime.nil?
        "∅"
      else
        I18n.l(datetime.localtime(utc_offset), format: format)
      end
    end
  end
end
