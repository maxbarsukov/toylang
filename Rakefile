# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :generate_parser do
  puts 'Generating a parser (lib/toylang/parser/parser.rb)...'
  `bundle exec racc -o lib/toylang/parser/parser.rb lib/toylang/grammar/grammar.y`
  puts 'Complete!'
end
