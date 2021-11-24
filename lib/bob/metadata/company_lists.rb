# frozen_string_literal: true

module Bob
  module MetaData
    class CompanyLists < API
      def self.all
        get('company/named-lists')
      end

      def self.find(list_name)
        get("company/named-lists/#{list_name}")
      end

      def self.add_item(list_name, params = {})
        post("company/named-lists/#{list_name}", params)
      end

      def self.update_item(list_name, item_id, params = {})
        put("company/named-lists/#{list_name}/#{item_id}", params)
      end

      def self.remove_item(list_name, item_id)
        delete("company/named-lists/#{list_name}/#{item_id}")
      end
    end
  end
end
