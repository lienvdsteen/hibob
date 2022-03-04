# frozen_string_literal: true

module Models
  class Base
    def initialize(raw)
      attributes = Bob::Util.underscorize_hash(raw)

      attributes.each do |k, v|
        instance_variable_set("@#{k}", v.is_a?(Hash) ? Models::Base.new(v) : v)
        self.class.send(:define_method, k, proc { instance_variable_get("@#{k}") })
        self.class.send(:define_method, "#{k}=", proc { |val| instance_variable_set("@#{k}", val) })
      end
    end
  end
end
