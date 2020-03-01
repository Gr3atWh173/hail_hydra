
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hail_hydra/version"

Gem::Specification.new do |spec|
  spec.name          = "hail_hydra"
  spec.version       = HailHydra::VERSION
  spec.authors       = ["Gr3atWh173"]
  spec.email         = ["Gr3atWh173@users.noreply.github.com"]

  spec.summary       = %q{Unofficial pseudo-API for ThePirateBay}
  spec.homepage      = "https://github.com/Gr3atWh173/hail_hydra"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "nokogiri", ">= 1.10.8"
  spec.add_dependency "httparty"
end
