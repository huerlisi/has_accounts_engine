# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'has_accounts_engine/version'

Gem::Specification.new do |s|
  # Description
  s.name         = "has_accounts_engine"
  s.version      = HasAccountsEngine::VERSION
  s.summary      = "HasAccountsEngine provides controllers, views for has_accounts."
  s.description  = "HasAccountsEngine is a full featured Rails 3 gem accompanying has_accounts with controllers, views..."

  s.homepage     = "https://github.com/huerlisi/has_accounts_engine"
  s.authors      = ["Simon Hürlimann (CyT)"]
  s.email        = ["simon.huerlimann@cyt.ch"]
  s.licenses     = ["MIT"]

  # Files
  s.extra_rdoc_files = [
    "MIT-LICENSE",
    "README.md"
  ]

  s.files        = `git ls-files app lib config db`.split("\n")

  s.platform     = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.3'

  # Dependencies
  s.add_dependency(%q<rails>, ["~> 3.2"])
  s.add_dependency(%q<has_accounts>, ["~> 2.1"])
  s.add_dependency(%q<has_vcards>)
  s.add_dependency(%q<i18n_rails_helpers>)
  s.add_dependency(%q<acts-as-taggable-on>)
  s.add_dependency(%q<validates_timeliness>)
  s.add_dependency(%q<inherited_resources>)
  s.add_dependency(%q<has_scope>)
  s.add_dependency(%q<simple_form>)
  s.add_dependency(%q<anjlab-bootstrap-rails>, ["~>2.1.0"])
end
