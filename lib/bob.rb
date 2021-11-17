# frozen_string_literal: true

require_relative 'bob/version'
require_relative 'bob/configuration'
require_relative 'bob/api'
require_relative 'bob/employees'
require_relative 'bob/time_off'

module Bob
  extend Configuration
end
