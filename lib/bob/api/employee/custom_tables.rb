# frozen_string_literal: true

module Bob
  module Employee
    class CustomTables < API
      def self.rows(employee_id, table_id, options = {includeHumanReadable: true})
        response = get("people/custom-tables/#{employee_id}/#{table_id}", options)
        TableParser.new(response).rows
      end

      def self.add_row(employee_id, table_id, row_data)
        post("people/custom-tables/#{employee_id}/#{table_id}", {values: row_data})
      end

      def self.update_row(employee_id, table_id, row_id, row_data)
        put("people/custom-tables/#{employee_id}/#{table_id}/#{row_id}", {RAW_BODY: row_data})
      end

      def self.remove_row(employee_id, table_id, row_id)
        delete("people/custom-tables/#{employee_id}/#{table_id}/#{row_id}")
      end
    end
  end
end
