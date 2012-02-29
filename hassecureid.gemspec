# -*- mode: ruby -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'hassecureid/version'

Gem::Specification.new do |s|
  s.name              = "hassecureid"
  s.version           = HasSecureId::VERSION
  s.platform          = Gem::Platform::RUBY
  s.author            = "Alan Shields"
  s.email             = ["alan@fake.domain.name"]
  s.homepage          = "https://github.com/alanshields/hassecureid"
  s.summary           = "Easily create random \"secure_id\"s for active record models"
  s.description       = "Lower your attack surface easily"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('activerecord', '>= 3.0.0')

  s.add_development_dependency('bundler')
  s.add_development_dependency('rake')
end
