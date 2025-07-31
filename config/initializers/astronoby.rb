# frozen_string_literal: true

require "singleton"

Astronoby.configuration.cache_enabled = true

class SPK
  include Singleton

  def self.inpop19a
    instance.inpop19a
  end

  def inpop19a
    Astronoby::Ephem.load("lib/astronoby/spk/inpop19a.bsp")
  end
end
