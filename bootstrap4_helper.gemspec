$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'bootstrap4_helper/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'bootstrap4_helper'
  spec.version     = Bootstrap4Helper::VERSION
  spec.authors     = ['Robert David']
  spec.email       = ['rdavid369@gmail.com']
  spec.homepage    = 'https://github.com/rdavid369/bootstrap4-helper'
  spec.summary     = 'Library for rapidly building bootstrap 4 components'
  spec.description = 'Library for rapidly building bootstrap 4 components'
  spec.license     = 'MIT'

  spec.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  spec.add_dependency 'rails', '< 6.0.0'

  spec.add_development_dependency 'bootstrap', '~> 4.3.1'
  spec.add_development_dependency 'jquery-rails'
  spec.add_development_dependency 'rails', '~> 5.2.3'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'solargraph'
  spec.add_development_dependency 'sqlite3'
end
