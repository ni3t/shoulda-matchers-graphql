module Shoulda
  module Matchers
    module Graphql
      module Fields
        class OfType < FieldMatcher
          attr_accessor :type_name

          def initialize(field_name, type_name)
            super(field_name)
            @type_name = type_name == :ID ? "ID" : type_name
          end

          def matches?(subject)
            super(subject)
            subject_return_type == type_name
          end

          def description
            super + ", of type #@type_name"
          end

          def failure_message
            "expected '#@field_name' to be of type #@type_name, but it was #{subject_return_type} instead"
          end

          def subject_return_type
            @subject.fields[@field_name].instance_variable_get("@return_type_expr")
          end
        end
      end
    end
  end
end
