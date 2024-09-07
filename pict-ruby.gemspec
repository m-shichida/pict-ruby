# frozen_string_literal: true

require_relative 'lib/pict_ruby/version'

Gem::Specification.new do |spec|
  spec.name = 'pict-ruby'
  spec.version = PictRuby::VERSION
  spec.authors = ['shichida.masatsugu']
  spec.email = ['shicchi.7913@icloud.com']

  spec.summary = 'summary'
  spec.description = 'description'
  spec.required_ruby_version = '>= 2.7.0'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
