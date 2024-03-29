# frozen_string_literal: true

class BaseParser
  attr_reader :json_response

  def initialize(json_response)
    @json_response = json_response
  end

  def fields
    Models::Base.new(json_response)
  end
end
