module Shoulda
  module Matchers
    module Graphql
      module Types
        class TypeMatcher
          attr_reader :type

          def initialize
            @subject = nil
          end

          def matches?(subject)
            @subject = subject
            self
          end
        end
      end
    end
  end
end
