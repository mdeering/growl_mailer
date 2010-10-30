# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "growl_mailer/version"

Gem::Specification.new do |s|
  s.name        = "growl_mailer"
  s.version     = GrowlMailer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael Deering"]
  s.email       = ["mdeering@mdeering.com"]
  s.homepage    = "http://rubygems.org/gems/growl_mailer"
  s.summary     = %q{Will Growl Message Deliveries}
  s.description = %q{Will Growl Message Deliveries}

  s.rubyforge_project = "growl_mailer"

  s.add_runtime_dependency 'growl'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
