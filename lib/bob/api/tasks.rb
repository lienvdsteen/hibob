# frozen_string_literal: true

module Bob
  class Tasks < API
    def self.all
      get('tasks')
    end
  end
end
