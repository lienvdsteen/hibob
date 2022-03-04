# frozen_string_literal: true

module Bob
  module Employee
    class EquityGrants < API
      def self.all(employee_id)
        response = get("people/#{employee_id}/equities")
        EquityGrantParser.new(response).equity_grants
      end

      def self.create(employee_id, params = {})
        post("people/#{employee_id}/equities", params)
      end

      def self.remove(employee_id, entry_id)
        delete("people/#{employee_id}/salaries/#{entry_id}")
      end
    end
  end
end
