# frozen_string_literal: true

class CompanyListParser < BaseParser
  def list
    Models::CompanyList.new(json_response)
  end

  def lists
    json_response.map { |_key, attributes| Models::CompanyList.new(attributes) }
  end
end
