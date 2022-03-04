# frozen_string_literal: true

class EmployeeParser < BaseParser
  def employee
    Models::Employee.new(json_response)
  end

  def employees
    json_response['employees'].map { |attributes| Models::Employee.new(attributes) }
  end
end
