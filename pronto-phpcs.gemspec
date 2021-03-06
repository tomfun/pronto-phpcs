# -*- encoding: utf-8 -*-
#
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'pronto/phpcs/version'
require 'English'

Gem::Specification.new do |s|
  s.name = 'pronto-phpcs'
  s.version = Pronto::PhpcsVersion::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'tomfun'
  s.email = 'tomfun1990@gmail.com'
  s.homepage = 'http://github.org/tomfun/pronto-phpcs'
  s.summary = <<-EOF
    Pronto runner for phpcs, pluggable linting utility for PHP
  EOF

  s.licenses = ['MIT']
  s.required_ruby_version = '>= 2.0.0'
  s.rubygems_version = '1.8.23'

  s.files = ["lib/pronto/phpcs/version.rb", "lib/pronto/phpcs.rb"]
  s.test_files = []
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.require_paths = ['lib']

  s.add_dependency('pronto', '~> 0.7.0')
  s.add_development_dependency('rake', '~> 11.0')
  s.add_development_dependency('rspec', '~> 3.4')
  s.add_development_dependency('rspec-its', '~> 1.2')
end
