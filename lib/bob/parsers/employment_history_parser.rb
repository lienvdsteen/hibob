# frozen_string_literal: true

class EmploymentHistoryParser < BaseParser
  def employment_histories
    json_response['values'].map { |attributes| Models::EmploymentHistory.new(attributes) }
  end
end
