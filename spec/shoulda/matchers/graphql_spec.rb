require "graphql"

RSpec.describe Shoulda::Matchers::Graphql do
  it "has a version number" do
    expect(Shoulda::Matchers::Graphql::VERSION).not_to be nil
  end

  context "on a type" do
    subject { PostType }
    it { should define_field("id").of_type(:id) }
    it { should define_field("text").of_type(:string) }
  end
end

# example schema

class Post
  attr_accessor :id, :text

  def initialize(id:, text:)
    @id, @text = id, text
  end
end

class PostType < GraphQL::Schema::Object
  description "Post type"

  field :id, ID, null: false
  field :text, String, null: false
end

class QueryType < GraphQL::Schema::Object
  description "Root Query"

  field :post, PostType, null: true do
    description "get a post by id"

    argument :id, ID, required: true
  end

  def post(id:)
    Post.new(id, "test")
  end
end

class Schema < GraphQL::Schema
  query QueryType
end
