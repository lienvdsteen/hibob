# frozen_string_literal: true

class TrainingParser < BaseParser
  def trainings
    json_response['values'].map { |attributes| Models::Training.new(attributes) }
  end
end
