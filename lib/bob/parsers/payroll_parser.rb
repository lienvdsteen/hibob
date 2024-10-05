# frozen_string_literal: true

class PayrollParser < BaseParser
  def payroll_histories
    json_response['employees'].map { |attributes| Models::Payroll.new(attributes) }
  end
end
