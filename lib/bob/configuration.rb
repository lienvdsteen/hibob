# frozen_string_literal: true

module Bob
  module Configuration
    VALID_OPTIONS_KEYS = %i[access_token access_user_name api_version use_sandbox custom_tables custom_fields
                            default_custom_fields].freeze
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
      self.access_token = ENV.fetch('ACCESS_TOKEN', nil)
      self.access_user_name = ENV.fetch('ACCESS_USER_NAME', nil)
      self.use_sandbox = false
      self.custom_tables = {}
      self.custom_fields = {}
      self.default_custom_fields = []
    end
  end
end
