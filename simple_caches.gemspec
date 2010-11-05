# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_caches/version"

Gem::Specification.new do |s|
  s.name        = "simple_caches"
  s.version     = BetterCounterCaches::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = "http://rubygems.org/gems/better_counter_caches"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.add_dependency('activerecord', '~>3.0.0')
  s.add_development_dependency('shoulda', '~>2.11.3')
  s.add_development_dependency('sqlite3-ruby', '~>1.3.0')
  s.rubyforge_project = "better_counter_caches"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
