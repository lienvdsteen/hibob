# frozen_string_literal: true

module Bob
  module Employee
    class LifecycleHistory < API
      def self.all(employee_id)
        response = get("people/#{employee_id}/lifecycle")
        LifecycleHistoryParser.new(response).lifecycle_histories
      end
    end
  end
end
