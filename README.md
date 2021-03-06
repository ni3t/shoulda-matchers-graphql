# Shoulda::Matchers::Graphql

Shoulda-style matchers for GraphQL. 

Note: not affiliated with [Thoughtbot's `Shoulda::Matchers`](https://github.com/thoughtbot/shoulda-matchers), but heavily inspired by and grateful for.

Another Note: This library works with or without `Shoulda::Matchers` in a project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shoulda-matchers-graphql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shoulda-matchers-graphql

## Usage

Configure RSpec:

```ruby
RSpec.configure do |config|
  config.include(Shoulda::Matchers::Graphql)
end
```

Use the matchers:

```ruby
class Types::Post < GraphQL::Schema::Object
  description "This is a Types::Post"
  field :id, ID, "ID description", null: false
  field :text, String, null: false
  field :author, Types::Author, null: false # defined elsewhere
  field :comments, [Types::Comment], null: true # defined elsewhere
end

class Types::QueryType < GraphQL::Schema::Object
  field :post, Types::Post, null: true do
    argument :id, ID, required: true
  end
end

RSpec.describe Types::Post do
  context "type and field matchers" do
    subject { Types::Post }
    it { should have_description("This is a Types::Post")}
    it { should define_field("id").of_type(:ID).required.with_description("ID Description") }
    it { should define_field("text").of_type(String).required }
    it { should define_field("author").of_type(Types::Author).required }
    it { should define_field("comments").of_type([Types::Comment]).optional }
  end
  context "argument matchers" do
    subject { Types::QueryType }
    it { should define_field("post").with_arguments(id: { required: true }) }
  end
  context "schema matchers" do
    subject { Schema }
    it { should define_query_type(Types::QueryType) }
    it { should define_mutation_type(Types::MutationType) }
    it { should define_subscription_type(Types::SubscriptionType) }
    it { should have_max_depth(200) }
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ni3t/shoulda-matchers-graphql.


