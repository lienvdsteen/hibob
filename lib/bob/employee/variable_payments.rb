# frozen_string_literal: true

module Bob
  module Employee
    class VariablePayments < API
      def self.all(employee_id)
        get("people/#{employee_id}/variable")
      end

      def self.create(employee_id, params = {})
        post("people/#{employee_id}/variable", params)
      end
    end
  end
end
