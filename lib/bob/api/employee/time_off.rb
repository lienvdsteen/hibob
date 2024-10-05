# frozen_string_literal: true

module Bob
  module Employee
    class TimeOff < API
      def self.balance(employee_id:, policy_type:, date:)
        response = get("timeoff/employees/#{employee_id}/balance", { policyType: policy_type, date: })
        BaseParser.new(response).fields
      end
    end
  end
end
