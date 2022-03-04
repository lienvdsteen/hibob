# frozen_string_literal: true

class VariablePaymentParser < BaseParser
  def variable_payments
    json_response['values'].map { |attributes| Models::VariablePayment.new(attributes) }
  end
end
