RSpec.describe "the whole thing" do
  it "has a version number" do
    expect(Shoulda::Matchers::Graphql::VERSION).not_to be nil
  end

  context "on a type" do
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

    context "#nullable" do
      it { should define_field("text").nullable }
    end

    context "#required" do
      it { should define_field("id").required }
    end

    context "#with_description" do
      it { should define_field("id").with_description("ID") }
    end

    context "combinations" do
      it { should define_field("text").with_description("Text Field").of_type(String).nullable }
    end
  end
end
