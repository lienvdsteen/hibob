# frozen_string_literal: true

module Bob
  module Employee
    class WorkHistory < API
      def self.all(employee_id)
        response = get("people/#{employee_id}/work")
        WorkHistoryParser.new(response).work_histories
      end

      def self.update(employee_id, work_history_id, params)
        put(
          "people/#{employee_id}/work/#{work_history_id}",
          params,
          use_api_key: true
        )
      end
    end
  end
end
