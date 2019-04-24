require "shoulda/matchers/graphql/version"
require "shoulda/matchers/graphql/fields"
require "shoulda/matchers/graphql/types"
require "shoulda/matchers/graphql/schema"

module Shoulda
  module Matchers
    # This module provides matchers for GraphQL

    module Graphql
      class Error < StandardError; end
    end
  end
end
