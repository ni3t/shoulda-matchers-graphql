module Shoulda
  module Matchers
    module Graphql
      module Schema
        def define_query_type(query_type)
          DefineQueryType.new(query_type)
        end

        class DefineQueryType < SchemaMatcher
          attr_accessor :query_type

          def initialize(query_type)
            @query_type = query_type
          end

          def matches?(subject)
            super(subject)
            subject_query_type == query_type
          end

          def failure_message
            "expected Schema to have query type #@query_type, but it was #{subject_query_type}"
          end

          def description
            "define query type #@query_type"
          end

          def subject_query_type
            @subject.instance_variable_get("@query_object")
          end
        end
      end
    end
  end
end
