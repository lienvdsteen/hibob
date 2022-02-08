# frozen_string_literal: true

module Bob
  class TimeOff < API
    def self.all_changed_since(since)
      get('timeoff/requests/changes', { since: since })['changes']
    end

    def self.today
      get('timeoff/outtoday')
    end

    def self.find_for_employee(employee_id, request_id)
      get("timeoff/employees/#{employee_id}/requests/#{request_id}")
    end
  end
end
