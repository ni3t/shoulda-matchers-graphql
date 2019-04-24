module Shoulda
  module Matchers
    module Graphql
      module Fields
        class Optional < FieldMatcher
          def initialize(field_name)
            super
          end

          def matches?(subject)
            subject.fields[@field_name].type.class != GraphQL::Schema::NonNull
          end

          def failure_message
            "expected #@field_name to be nullable, but it is not nullable."
          end

          def description
            super + ", optional"
          end
        end
      end
    end
  end
end
