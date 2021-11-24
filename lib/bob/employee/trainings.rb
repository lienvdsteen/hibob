# frozen_string_literal: true

module Bob
  module Employee
    class Trainings < API
      def self.all(employee_id)
        get("people/#{employee_id}/training")
      end

      def self.create(employee_id, params = {})
        post("people/#{employee_id}/training", params)
      end

      def self.remove(employee_id, training_id)
        delete("people/#{employee_id}/training/#{training_id}")
      end
    end
  end
end
