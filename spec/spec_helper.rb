require "shoulda-matchers"
require "shoulda/matchers/graphql"
require "graphql"

RSpec.configure do |c|
  c.include(Shoulda::Matchers::Graphql::Fields)
end

# example schema

class Post
  attr_accessor :id, :text

  def initialize(id:, text:)
    @id, @text = id, text
  end
end

module Types; end

class Types::Comment < GraphQL::Schema::Object
  description "Comment type"

  field :id, ID, null: false
  field :text, String, null: true
end

class Types::Author < GraphQL::Schema::Object
  description "Author type"

  field :id, ID, null: false
  field :name, String, null: true
end

class Types::Post < GraphQL::Schema::Object
  description "Post type"

  field :id, ID, "ID", null: false
  field :text, String, null: true do
    description "Text Field"
  end
  field :author, Types::Author, null: false
  field :comments, [Types::Comment], null: true
end

class Types::QueryType < GraphQL::Schema::Object
  description "Root Query"

  field :post, Types::Post, null: true do
    description "get a post by id"

    argument :id, ID, required: true
  end

  def post(id:)
    ::Post.new(id, "test")
  end
end

class Schema < GraphQL::Schema
  query Types::QueryType
end
