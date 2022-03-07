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
      @return_date = parsed_end_date + 1.day
    end

    def multiple_days?
      total_days_off > 1
    end

    def total_days_off
      (start_date...end_date).count + 1
    end

    private

    def parsed_start_date
      Date.parse(start_date)
    end

    def parsed_end_date
      Date.parse(end_date)
    end
  end
end