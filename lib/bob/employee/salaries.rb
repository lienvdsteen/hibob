# frozen_string_literal: true

module Bob
  module Employee
    class Salaries < API
      def self.all(employee_id)
        get("people/#{employee_id}/salaries")
      end

      def self.create(employee_id, params = {})
        post("people/#{employee_id}/salaries", params)
      end

      def self.remove(employee_id, salary_id)
        delete("people/#{employee_id}/salaries/#{salary_id}")
      end
    end
  end
end
