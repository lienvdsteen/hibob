# frozen_string_literal: true

require_relative 'employee/invites'
require_relative 'employee/trainings'
require_relative 'employee/salaries'
require_relative 'employee/equity_grants'
require_relative 'employee/documents'
require_relative 'employee/variable_payments'

module Bob
  class Employees < API
    def self.all(params = { includeHumanReadable: true })
      response = get('people', params)
      EmployeeParser.new(response).employees
    end

    def self.all_people_managers(params = { includeHumanReadable: true })
      response = get('people', params)
      EmployeeParser.new(response).managers
    end

    def self.find(employee_id_or_email, params: { includeHumanReadable: true })
      response = get("people/#{employee_id_or_email}", params)
      EmployeeParser.new(response).employee
    end

    def self.find_by(field:, value:, params: { includeHumanReadable: true })
      all(params).find do |employee|
        employee.send(field) == value
      end
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
