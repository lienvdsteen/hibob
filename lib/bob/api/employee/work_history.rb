# frozen_string_literal: true

module Bob
  module Employee
    class WorkHistory < API
      def self.all(employee_id, include_raw: false)
        response = get("people/#{employee_id}/work")
        parsed = WorkHistoryParser.new(response).work_histories
        return { data: parsed, raw: response.values.first } if include_raw

        parsed
      end

      def self.create(employee_id, params)
        post("people/#{employee_id}/work", params)
      end

      def self.update(employee_id, work_history_id, params)
        put("people/#{employee_id}/work/#{work_history_id}", params)
      end

      def self.remove(employee_id, work_history_id)
        delete("people/#{employee_id}/work/#{work_history_id}")
      end
    end
  end
end
