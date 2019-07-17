# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lorem_helper/version'

Gem::Specification.new do |spec|
  spec.name          = 'lorem_helper'
  spec.version       = LoremHelper::VERSION
  spec.authors       = ['Scott Nelson']
  spec.email         = ['snelson@barefootproximity.com']

  spec.summary       = 'Lorem Ipsum Helper methods.'
  spec.description   = 'Includes both a random Lorem generator and a static generator (for use with visual regression testing)'
  spec.homepage      = 'https://github.com/BarefootProximity/lorem-helper'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53.0'

  spec.add_runtime_dependency 'faker', '~> 1.8', '>= 1.8.7'
end
