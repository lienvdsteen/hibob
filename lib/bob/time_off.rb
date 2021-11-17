# frozen_string_literal: true

module Bob
  class TimeOff < API
    def self.all_changed_since(since)
      get('timeoff/requests/changes', { since: since })
    end
  end
end
