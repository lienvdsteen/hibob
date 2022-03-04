# frozen_string_literal: true

module Bob
  module MetaData
    class CompanyFields < API
      def self.all
        response = get('company/people/fields')
        CompanyFieldParser.new(response).fields
      end

      def self.create(params = {})
        post('company/people/fields', params)
      end

      def self.update(field_id, params = {})
        put("company/people/fields/#{field_id}", params)
      end

      def self.remove(field_id)
        delete("company/people/fields/#{field_id}")
      end
    end
  end
end
