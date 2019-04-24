module Shoulda
  module Matchers
    module Graphql
      module Fields
        class WithDescription < FieldMatcher
          def initialize(field_name, field_description)
            super(field_name)
            @field_description = field_description
          end

          def matches?(subject)
            super(subject)
            subject_description.to_s == @field_description.to_s
          end

          def description
            super + ", with description #@field_description"
          end

          def failure_message
            "expected the field_description to be '#@field_description', but it was '#{subject_description}' instead."
          end

          def subject_description
            @subject.fields[@field_name].description
          end
        end
      end
    end
  end
end
