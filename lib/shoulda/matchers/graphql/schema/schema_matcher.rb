module Shoulda
  module Matchers
    module Graphql
      module Schema
        class SchemaMatcher
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
