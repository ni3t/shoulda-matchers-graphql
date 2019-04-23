require "shoulda-matchers"
require "shoulda/matchers/graphql"

RSpec.configure do |c|
  c.include(Shoulda::Matchers::Graphql)
end
