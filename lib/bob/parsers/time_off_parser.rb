# frozen_string_literal: true

class TimeOffParser < BaseParser
  def event
    Models::TimeOff.new(json_response)
  end

  def events
    json_response['outs'].map { |attributes| Models::TimeOff.new(attributes) }
  end
end
