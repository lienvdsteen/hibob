# frozen_string_literal: true

module Models
  class TimeOff < Models::Base
    def employee
      @employee ||= Bob::Employees.find(employee_id)
    end

    def parental_leave?
      policy_type_display_name == 'Parental Leave'
    end

    def created?
      change_type == 'Created'
    end

    def return_date
      @return_date = Date.parse(end_date) + 1.day
    end
  end
end
