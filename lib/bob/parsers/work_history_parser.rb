# frozen_string_literal: true

class WorkHistoryParser < BaseParser
  def work_histories
    json_response['values'].map { |attributes| Models::WorkHistory.new(attributes) }
  end
end
