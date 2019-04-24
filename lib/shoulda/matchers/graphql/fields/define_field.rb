module Shoulda
  module Matchers
    module Graphql
      module Fields
        def define_field(field_name)
          DefineField.new(field_name)
        end

        class DefineField < FieldMatcher
          attr_accessor :field_name

          def initialize(field_name)
            super
          end

          def matches?(subject)
            super(subject)
            subject.respond_to?(:fields) && !subject.fields[field_name].nil?
          end

          def description
            "define field '#@field_name'"
          end
        end
      end
    end
  end
end
