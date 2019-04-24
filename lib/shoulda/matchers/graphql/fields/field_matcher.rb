module Shoulda
  module Matchers
    module Graphql
      module Fields
        class FieldMatcher
          attr_reader :field_name

          def initialize(field_name)
            @field_name = field_name
            @subject = nil
          end

          def description
            "define field #@field_name"
          end

          def matches?(subject)
            @subject = subject
            self
          end

          def of_type(type_name)
            OfType.new(@field_name, type_name)
          end

          def optional
            Optional.new(@field_name)
          end

          def required
            Required.new(@field_name)
          end

          def with_description(field_description)
            WithDescription.new(@field_name, field_description)
          end

          def with_arguments(argument_hash)
            WithArguments.new(@field_name, argument_hash)
          end
        end
      end
    end
  end
end
