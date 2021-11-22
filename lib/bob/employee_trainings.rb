# frozen_string_literal: true

module Bob
  class EmployeeTrainings < API
    def self.all(employee_id)
      get("people/#{employee_id}/training")
    end
  end
end
