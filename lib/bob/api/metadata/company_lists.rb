# frozen_string_literal: true

module Bob
  module MetaData
    class CompanyLists < API
      def self.all(options = {includeArchived: false})
        response = get('company/named-lists', options)
        CompanyListParser.new(response).lists
      end

      def self.find(list_name, options = {includeArchived: false})
        response = get("company/named-lists/#{list_name}", options)
        CompanyListParser.new(response).list
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
