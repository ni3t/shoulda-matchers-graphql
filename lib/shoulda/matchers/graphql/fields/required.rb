module Shoulda
  module Matchers
    module Graphql
      module Fields
        class Required < FieldMatcher
          def initialize(field_name)
            super
          end

          def matches?(subject)
            super(subject)
            @subject.fields[@field_name].type.class == GraphQL::Schema::NonNull
          end

          def description
            super + ", required"
          end

          def failure_message
            "expected '#{@subject.fields[@field_name]}' to be required, but it was not."
          end
        end
      end
    end
  end
end
