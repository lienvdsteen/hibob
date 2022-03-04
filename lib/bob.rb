# frozen_string_literal: true

require_relative 'bob/version'
require_relative 'bob/configuration'
require_relative 'bob/api/api'
require_relative 'bob/api/employees'
require_relative 'bob/api/time_off'
require_relative 'bob/api/onboarding_wizards'
require_relative 'bob/api/metadata'
require_relative 'bob/api/reports'
require_relative 'bob/webhooks'
require_relative 'bob/models'
require_relative 'bob/parsers'
require_relative 'bob/util'

module Bob
  extend Configuration
end
