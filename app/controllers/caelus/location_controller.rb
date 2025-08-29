# frozen_string_literal: true

module Caelus
  class LocationController < ApplicationController
    def edit
      @latitude = @observer.latitude.degrees.round(4)
      @longitude = @observer.longitude.degrees.round(4)
    end

    def update
      cookies.permanent.signed[:latitude] = params[:latitude]
      cookies.permanent.signed[:longitude] = params[:longitude]

      redirect_to caelus_root_path
    end
  end
end
