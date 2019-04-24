# Shoulda::Matchers::Graphql

Shoulda-style matchers for GraphQL.

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

```
class Types::Post < GraphQL::Schema::Object
  field :id, ID, "ID description", null: false
  field :text, String, null: false
  field :author, Types::Author, null: false # defined elsewhere
  field :comments, [Types::Comment], null: true # defined elsewhere
end

RSpec.describe Types::Post do
  subject { Types::Post }
  it { should define_field("id").of_type(:ID).required.with_description("ID Description") }
  it { should define_field("text").of_type(String).required }
  it { should define_field("author").of_type(Types::Author).required }
  it { should define_field("comments").of_type([Types::Comment]).optional }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/shoulda-matchers-graphql.


to use:
