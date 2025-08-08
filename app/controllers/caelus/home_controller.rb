# frozen_string_literal: true

module Caelus
  class HomeController < ApplicationController
    def index
      @planets = [
        Mercury.new,
        Venus.new,
        Mars.new,
        Jupiter.new,
        Saturn.new,
        Uranus.new,
        Neptune.new
      ]
    end
  end
end
