# frozen_string_literal: true

module Bob
  module Employee
    class EmploymentHistory < API
      def self.all(employee_id)
        response = get("people/#{employee_id}/employment")
        EmploymentHistoryParser.new(response).employment_histories
      end

      def self.create(employee_id, params)
        post("people/#{employee_id}/employment", params)
      end

      def self.update(employee_id, employment_entry_id, params)
        put(
          "people/#{employee_id}/employment/#{employment_entry_id}",
          params,
          use_api_key: true
        )
      end

      def self.remove(employee_id, employment_entry_id)
        delete("people/#{employee_id}/employment/#{employment_entry_id}")
      end
    end
  end
end
