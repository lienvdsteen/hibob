# frozen_string_literal: true

class EmployeeParser
  attr_reader :json_response

  def initialize(json_response)
    @json_response = json_response
  end

  def employee
    Models::Employee.new(json_response)
  end

  def employees
    json_response['employees'].map { |attributes| Models::Employee.new(attributes) }
  end
end
