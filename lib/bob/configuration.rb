# frozen_string_literal: true

module Bob
  module Configuration
    VALID_OPTIONS_KEYS = %i[access_token access_user_name api_version].freeze
    attr_accessor(*VALID_OPTIONS_KEYS)

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def config
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset
      self.api_version = 'v1'
      self.access_token = ENV['ACCESS_TOKEN']
      self.access_user_name = ENV['ACCESS_USER_NAME']
    end
  end
end
