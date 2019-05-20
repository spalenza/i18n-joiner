# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "i18n/joiner/version"

Gem::Specification.new do |spec|
  spec.name          = "i18n-joiner"
  spec.version       = I18n::Joiner::VERSION
  spec.authors       = ["Rodolfo Spalenza"]
  spec.email         = ["rodolfo.spalenza@gmail.com"]

  spec.summary       = %q{Organize many differents I18n files with the same language base.}
  spec.description   = %q{Join many I18n files like es-CO.yml, es-DO.yml, es-MX.yml in only one file es.yml and maintain the difference in specifics I18n files.}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hashdiff", "~> 0.3"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "deepsort", "~> 0.4"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12"
  spec.add_development_dependency "pry-byebug", "~> 3.7"
end
