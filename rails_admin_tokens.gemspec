require_relative "lib/rails_admin_tokens/version"

Gem::Specification.new do |spec|
  spec.name = "rails_admin_tokens"
  spec.version = RailsAdminTokens::VERSION
  spec.authors = ["Dinis"]
  spec.email = ["dinis@lage.pw"]
  spec.homepage = "https://lage.pw"
  spec.summary = "Rails Admin action to call a custom method on object."
  spec.description = "Setup an action to be called for the configured object."
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dlage/rails_admin_tokens"
  spec.metadata["changelog_uri"] = "https://github.com/dlage/rails_admin_tokens"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
end
