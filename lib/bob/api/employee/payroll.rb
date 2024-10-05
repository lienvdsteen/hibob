# frozen_string_literal: true

module Bob
  module Employee
    class Payroll < API
      # Fetches all payroll histories.
      # @param params [Hash] Optional parameters for the request.
      # @return [Array<PayrollHistory>] An array of payroll history records.
      def self.all(params = { showInactive: false })
        response = get('payroll/history', params)
        PayrollParser.new(response).payroll_histories
      end
    end
  end
end
