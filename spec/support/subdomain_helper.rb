# frozen_string_literal: true

module SubdomainHelper
  def self.included(base)
    base.class_eval do
      %i[get post patch put delete].each do |method|
        define_method(method) do |path, **args|
          if self.class.metadata[:file_path]&.include?("caelus")
            args[:headers] ||= {}
            args[:headers]["HTTP_HOST"] = "caelus.lvh.me"
          end
          super(path, **args)
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include SubdomainHelper, type: :request
end
