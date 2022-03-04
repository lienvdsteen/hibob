# frozen_string_literal: true

class EquityGrantParser < BaseParser
  def equity_grants
    json_response['values'].map { |attributes| Models::EquityGrant.new(attributes) }
  end
end
