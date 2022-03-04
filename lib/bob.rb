# frozen_string_literal: true

require_relative 'bob/version'
require_relative 'bob/configuration'
require_relative 'bob/api'
require_relative 'bob/employees'
require_relative 'bob/time_off'
require_relative 'bob/onboarding_wizards'
require_relative 'bob/metadata'
require_relative 'bob/reports'
require_relative 'bob/webhooks'
require_relative 'bob/models'
require_relative 'bob/parsers'
require_relative 'bob/util'

module Bob
  extend Configuration
end
