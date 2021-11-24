# frozen_string_literal: true

module Bob
  module Employee
    class Invites < API
      def self.send(employee_id, wizard_id)
        post("employees/#{employee_id}/invitations", { welcomeWizardId: wizard_id })
      end

      def self.revoke(employee_id)
        post("employees/#{employee_id}/uninvite")
      end
    end
  end
end
