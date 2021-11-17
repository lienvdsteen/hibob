# frozen_string_literal: true

module Bob
  module Configuration
    VALID_OPTIONS_KEYS = %i[access_token].freeze
    attr_accessor(*VALID_OPTIONS_KEYS)

    def configure
      yield self
    end
  end
end
