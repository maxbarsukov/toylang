# frozen_string_literal: true

require_relative 'lib/toylang/version'

Gem::Specification.new do |spec|
  spec.name = 'toylang'
  spec.version = Toylang::VERSION
  spec.authors = ['maxbarsukov']
  spec.email = ['maximbarsukov@bk.ru']

  spec.summary = ':teddy_bear: Toy OOP Language'
  spec.description = 'Simple Interpreter for Python-like OOP programming language'
  spec.homepage = 'https://rubygems.org/gems/toylang'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/maxbarsukov/toylang'
  spec.metadata['changelog_uri'] = 'https://github.com/maxbarsukov/toylang/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'bin'
  spec.executables << 'toylang'
  spec.require_paths = ['lib']

  # Dependencies
  spec.add_dependency 'racc', '~> 1.6'

  # Development dependencies
  spec.add_development_dependency 'codecov', '~> 0.6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
  spec.add_development_dependency 'rubocop-performance', '~> 1.13'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.7'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end
