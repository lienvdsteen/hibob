# frozen_string_literal: true

module Bob
  class Reports < API
    def self.all
      get('company/reports')
    end

    def self.read(report_id)
      get("company/reports/#{report_id}/download?format=csv", {}, true)
    end
  end
end
