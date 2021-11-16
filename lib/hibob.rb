# frozen_string_literal: true

require_relative "hibob/version"

module Hibob
  def self.configuration
    @configuration ||= OpenStruct.new
  end

  def self.config
    yield(configuration)
  end
end
