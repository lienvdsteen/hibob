# frozen_string_literal: true

require_relative 'lib/bob/version'

Gem::Specification.new do |spec|
  spec.name          = 'bobhr'
  spec.version       = Bob::VERSION
  spec.authors       = ['Lien Van Den Steen']
  spec.email         = ['lienvandensteen@gmail.com']

  spec.summary       = 'Ruby gem for Bob API'
  spec.description   = 'Ruby gem for Bob API'
  spec.homepage      = 'https://github.com/lienvdsteen/hibob'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/lienvdsteen/hibob'
  spec.metadata['changelog_uri'] = 'https://github.com/lienvdsteen/hibob/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['{data,lib}/**/*', 'LICENSE.txt', 'README.md']
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'rest-client', '~> 2.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
