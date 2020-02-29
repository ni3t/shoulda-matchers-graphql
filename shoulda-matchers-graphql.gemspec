
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shoulda/matchers/graphql/version"

Gem::Specification.new do |spec|
  spec.name = "shoulda-matchers-graphql"
  spec.version = Shoulda::Matchers::Graphql::VERSION
  spec.authors = ["Nick Bell"]
  spec.email = ["bell.nicholas.p@gmail.com"]
  spec.licenses = ["MIT"]

  spec.summary = %q{Shoulda style matchers for GraphQL}
  spec.description = %q{Shoulda style matchers for GraphQL...}
  spec.homepage = "https://github.com/ni3t/shoulda-matchers-graphql"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard", "~> 0.9.19"

  spec.add_development_dependency "shoulda-matchers", "~> 4.0.1"
end
