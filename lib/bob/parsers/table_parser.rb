# frozen_string_literal: true

class TableParser < BaseParser
  def rows
    json_response['values'].map { |attributes| Models::Table.new(attributes) }
  end
end
