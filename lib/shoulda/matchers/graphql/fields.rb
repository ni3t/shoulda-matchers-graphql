module Shoulda
  module Matchers
    module Graphql
      def define_field(field_name)
        Fields.new(field_name)
      end

      class Fields
        def initialize(field_name)
          @field_name = field_name
          @subject = nil
        end

        def of_type(type_name)
          OfType.new(@field_name, type_name)
        end

        def matches?(subject)
          @subject = subject
          subject.respond_to?(:fields) && !subject.fields[@field_name].nil?
        end

        def description
          "validate #@field_name exists"
        end

        def failure_message
          "expected #{@subject.class_name} to have field #{@field_name}"
        end
      end

      class OfType
        attr_accessor :field_name, :type_name

        def initialize(field_name, type_name)
          @field_name = field_name
          @type_name = type_name
          @subject = nil
        end

        def matches?(subject)
          @subject = subject
          return_type = subject.fields[@field_name].instance_variable_get("@return_type_expr").to_s.downcase
          type_name.to_s.downcase == return_type
        end

        def description
          "validate #@field_name of type #@type_name exists"
        end

        def failure_message
          "expected #{@subject.class_name} to have field #{@field_name} of type #{@type_name}"
        end
      end
    end
  end
end
