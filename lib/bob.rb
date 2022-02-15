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

module Bob
  extend Configuration
end
