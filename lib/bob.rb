# frozen_string_literal: true

require_relative 'bob/version'
require_relative 'bob/configuration'
require_relative 'bob/api'
require_relative 'bob/employees'
require_relative 'bob/employee_invites'
require_relative 'bob/employee_trainings'
require_relative 'bob/time_off'
require_relative 'bob/onboarding_wizards'

module Bob
  extend Configuration
end
