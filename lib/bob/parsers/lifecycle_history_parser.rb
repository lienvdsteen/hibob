# frozen_string_literal: true

class LifecycleHistoryParser < BaseParser
  def lifecycle_histories
    json_response['values'].map { |attributes| Models::LifecycleHistory.new(attributes) }
  end
end
