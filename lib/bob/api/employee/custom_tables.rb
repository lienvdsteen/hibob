# frozen_string_literal: true

module Bob
  module Employee
    class CustomTables < API
      def self.rows(employee_id, table_id)
        response = get("people/custom-tables/#{employee_id}/#{table_id}")
        TableParser.new(response).rows
      end

      def self.add_row(employee_id, table_id, row_data)
        post("people/custom-tables/#{employee_id}/#{table_id}", {values: row_data})
      end

      def self.remove_row(employee_id, table_id, row_id)
        delete("people/custom-tables/#{employee_id}/#{table_id}/#{row_id}")
      end
    end
  end
end
