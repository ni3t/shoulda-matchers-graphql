module Shoulda
  module Matchers
    module Graphql
      module Fields
        class WithArguments < FieldMatcher
          def initialize(field_name, **args)
            super(field_name)
            @arguments = *args
          end

          def matches?(subject)
            super(subject)
            @arguments.map do |k, v|
              tokens = k.to_s.split("_")
              first, *rem = tokens
              rem = rem.map(&:capitalize)
              camelized = first + rem.join
              if field_arguments[camelized].nil?
                return false
              end
              #TODO: additional options checks, refactor into own module
              if !v[:required].nil?
                required = v[:required]
                nullable = field_arguments[camelized].instance_variable_get("@null")
                required == !nullable
              else
                true
              end
            end.all?
          end

          def description
            args = @arguments.join(", ")
            super + ", with argument(s) #{args}"
          end

          def field_arguments
            @subject.fields[@field_name].instance_variable_get("@own_arguments")
          end

          def failure_message
            "oops"
          end
        end
      end
    end
  end
end
