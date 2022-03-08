# frozen_string_literal: true

# Credits to https://github.com/myponto/ponto-ruby/blob/master/lib/ponto/util.rb
module Bob
  module Util
    def self.underscorize_hash(attributes)
      attributes.keys.each_with_object({}) do |key, result|
        result[underscore(key)] = attributes[key]
      end
    end

    def self.underscore(camel_cased_word)
      return camel_cased_word unless camel_cased_word =~ /[A-Z-]/

      word = camel_cased_word.to_s.gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      word.tr!('-', '_')
      word.tr!(' ', '_')
      word.downcase!
      word
    end
  end
end
