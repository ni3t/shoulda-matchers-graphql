module Shoulda
  module Matchers
    module Graphql
      module Types
        def have_description(type_description)
          HaveDescription.new(type_description)
        end

        class HaveDescription < TypeMatcher
          attr_accessor :type_description

          def initialize(type_description)
            @type_description = type_description
          end

          def matches?(subject)
            super(subject)
            @subject.description == type_description
          end

          def description
            "have description '#@type_description'"
          end

          def failure_message
            "expected #@subject to have description '#@type_description', but it was '#{@subject.description}'"
          end
        end
      end
    end
  end
end
