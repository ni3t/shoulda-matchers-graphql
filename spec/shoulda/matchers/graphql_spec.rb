RSpec.describe "the whole thing" do
  it "has a version number" do
    expect(Shoulda::Matchers::Graphql::VERSION).not_to be nil
  end

  context "types" do
    subject { Types::Post }
    it { should have_description("Post type") }
    it { should_not have_description("Post type...") }
  end

  context "fields" do
    subject { Types::Post }

    context "#define_field" do
      it { should define_field("id") }
      it { should_not define_field("not found") }
    end

    context "#of_type" do
      it { should define_field("id").of_type(:ID) }
      it { should define_field("text").of_type(String) }
      it { should define_field("author").of_type(Types::Author) }
      it { should define_field("comments").of_type([Types::Comment]) }
    end

    context "#optional" do
      it { should define_field("text").optional }
    end

    context "#required" do
      it { should define_field("id").required }
    end

    context "#with_description" do
      it { should define_field("id").with_description("ID") }
    end
    context "#with_arguments" do
      it { should define_field("upvotes").with_arguments(status: { required: true }, hot_post: { required: false }) }
    end

    context "combinations" do
      it { should define_field("text").with_description("Text Field").of_type(String).optional }
    end
  end

  context "schema" do
    subject { Schema }
    it { should define_query_type(Types::QueryType) }
  end
end
