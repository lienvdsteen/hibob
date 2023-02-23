# frozen_string_literal: true

module Bob
  module MetaData
    class TimeOffPolicies < API
      def self.all
        get('timeoff/policy-types')['policyTypes']
      end

      def self.find(policy_name)
        response = get('timeoff/policies', { policyName: policy_name })
        BaseParser.new(response).fields
      end

      def self.names_for(policy_name)
        get('timeoff/policies/names', { policyTypeName: policy_name })['policies']
      end
    end
  end
end
