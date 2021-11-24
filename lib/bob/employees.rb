# frozen_string_literal: true

require_relative 'employee/invites'
require_relative 'employee/trainings'
require_relative 'employee/salaries'
require_relative 'employee/equity_grants'

module Bob
  class Employees < API
    def self.all(params = {})
      get('people', params)
    end

    def self.find(employee_id_or_email)
      get("people/#{employee_id_or_email}")
    end

    # start date needs to be in ISO format
    def self.update_start_date(employee_id, start_date)
      post("employees/#{employee_id}", { startDate: start_date })
    end

    def self.update_email(employee_id, email)
      put("people/#{employee_id}/email", { email: email })
    end
  end
end
