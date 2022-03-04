# frozen_string_literal: true

class SalaryParser < BaseParser
  def salaries
    json_response['values'].map { |attributes| Models::Salary.new(attributes) }
  end
end
