# frozen_string_literal: true

class EmployeeParser < BaseParser
  def employee
    Models::Employee.new(json_response)
  end

  def employees
    json_response['employees'].map { |attributes| Models::Employee.new(attributes) }
  end

  def managers
    json_response['employees']
      .select { |employee| employee['work']['isManager'] }
      .map { |attributes| Models::Employee.new(attributes) }
  end

  def starters_on(date)
    json_response['employees']
      .select { |employee| employee['work']['startDate'] == date }
      .map { |attributes| Models::Employee.new(attributes) }
  end
end
