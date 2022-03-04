# frozen_string_literal: true

module Bob
  class TimeOff < API
    def self.all_changed_since(since)
      response = get('timeoff/requests/changes', { since: since })['changes']
      TimeOffParser.new({ 'outs' => response }).events
    end

    def self.today
      response = get('timeoff/outtoday')
      TimeOffParser.new(response).events
    end

    def self.find_for_employee(employee_id, request_id)
      response = get("timeoff/employees/#{employee_id}/requests/#{request_id}")
      TimeOffParser.new(response).event
    end
  end
end
