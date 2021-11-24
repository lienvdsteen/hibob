# frozen_string_literal: true

module Bob
  module Employee
    class Documents < API
      def self.add_public_document(employee_id, params = {})
        post("docs/people/#{employee_id}/shared", params)
      end

      def self.add_private_document(employee_id, params = {})
        post("docs/people/#{employee_id}/confidential", params)
      end
    end
  end
end
