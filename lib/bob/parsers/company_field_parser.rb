# frozen_string_literal: true

class CompanyFieldParser < BaseParser
  def fields
    json_response.map { |attributes| Models::CompanyField.new(attributes) }
  end
end
