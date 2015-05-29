# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tumblr_client_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "tumblr_client_wrapper"
  spec.version       = TumblrClientWrapper::VERSION
  spec.authors       = ["Richardson Dackam"]
  spec.email         = ["richardsondx@gmail.com"]

  spec.summary       = %q{Easily embed your tumblr posts on your rails appplication}
  spec.description   = %q{A Ruby wrapper for the Tumblr-client gem and Tumblr v2 API. The Tumblr-client-wrapper allow yout easily embed tumblr on your site}
  spec.homepage      = "http://github.com/richardsondx/tumblr_client_wrapper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.7.9"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_dependency "railties", "~> 3.1"
end
