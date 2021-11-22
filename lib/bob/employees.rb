# frozen_string_literal: true

module Bob
  class Employees < API
    def self.all(params = {})
      get('people', params)
    end

    def self.find(employee_id_or_email)
      get("people/#{employee_id_or_email}")
    end

    # start date needs to be in ISO format
    def self.update_start_date(employee_id, start_date)
      post("employees/#{employee_id}", { startDate: start_date })
    end
  end
end
