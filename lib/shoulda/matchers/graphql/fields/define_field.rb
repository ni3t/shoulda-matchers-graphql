module Shoulda
  module Matchers
    module Graphql
      module Fields
        # The 'define_field' matcher is the starting point for field-level validations.
        #
        #     class PostType < GraphQL::Schema::Object
        #       field :some_field, String, null: false
        #     end
        #
        #     #RSpec
        #     RSpec.describe PostType do
        #       it { should have_field("some_field") }
        #     end
        #
        # ## Qualifiers
        #
        # ### `of_type`
        #
        # Use `of_type` if you want to test the return type of the field
        #
        #     class PostType < GraphQL::Schema::Object
        #       field :some_field, String, null: false
        #     end
        #
        #     #RSpec
        #     RSpec.describe PostType do
        #       it { should have_field("some_field").of_type(String) }
        #     end
        #

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
