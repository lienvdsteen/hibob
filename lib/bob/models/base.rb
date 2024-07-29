# frozen_string_literal: true

module Models
  class Base
    def initialize(raw) # rubocop:disable Metrics/AbcSize
      attributes = Bob::Util.underscorize_hash(raw)

      attributes.each do |k, v|
        k = "field_#{k}" if k.instance_of?(String) && k.to_i.positive?
        instance_variable_set("@#{k}", v.is_a?(Hash) ? Models::Base.new(v) : v)
        self.class.send(:define_method, k, proc { instance_variable_get("@#{k}") })
        self.class.send(:define_method, "#{k}=", proc { |val| instance_variable_set("@#{k}", val) })
      rescue NameError
        next
      end
    end

    def dig_custom_field(field)
      Bob.custom_fields[field][:dig_path].reduce(self) { |response, sub_field| response.send(sub_field) }
    rescue NoMethodError => e
      Rails.logger.info("Error: #{e.message}")
      nil
    end
  end
end
