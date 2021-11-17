# frozen_string_literal: true

module Bob
  class Employees < API
    def self.all(params = {})
      get('people', params)
    end

    def self.find(id_or_email)
      get("people/#{id_or_email}")
    end
  end
end
