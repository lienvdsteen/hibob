# frozen_string_literal: true

require_relative "bob/version"

module Bob
  def self.configuration
    @configuration ||= OpenStruct.new
  end

  def self.config
    yield(configuration)
  end
end
