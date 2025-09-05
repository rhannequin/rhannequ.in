# frozen_string_literal: true

module Caelus
  class HomeController < ApplicationController
    def index
      @planets = Rails.cache.fetch(
        "planets/#{observer_cache_key}/#{Date.current}",
        expires_at: observer_end_of_day
      ) do
        [
          Mercury.new(observer: @observer),
          Venus.new(observer: @observer),
          Mars.new(observer: @observer),
          Jupiter.new(observer: @observer),
          Saturn.new(observer: @observer),
          Uranus.new(observer: @observer),
          Neptune.new(observer: @observer)
        ]
      end

      @sun = Rails.cache.fetch(
        "sun/#{observer_cache_key}",
        expires_in: 6.hours
      ) do
        Sun.new(observer: @observer)
      end

      @moon = Rails.cache.fetch(
        "moon/#{observer_cache_key}",
        expires_in: 6.hours
      ) do
        Moon.new(observer: @observer)
      end

      @twilight_events = Rails.cache.fetch(
        "twilight_events/#{observer_cache_key}/#{Date.current}",
        expires_at: observer_end_of_day
      ) do
        Astronoby::TwilightCalculator.new(
          observer: @observer,
          ephem: SPK.inpop19a
        ).event_on(Date.today)
      end

      @next_twilight_events = Rails.cache.fetch(
        "next_twilight_events/#{observer_cache_key}/#{Date.current}",
        expires_at: observer_end_of_day
      ) do
        Astronoby::TwilightCalculator.new(
          observer: @observer,
          ephem: SPK.inpop19a
        ).event_on(Date.tomorrow)
      end
    end
  end
end
