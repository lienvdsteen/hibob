# frozen_string_literal: true

class CompanyListParser < BaseParser
  def list
    json_response['values'].map { |attributes| Models::CompanyList.new(attributes) }
  end

  def lists
    json_response.map { |_key, attributes| Models::CompanyList.new(attributes) }
  end
end
