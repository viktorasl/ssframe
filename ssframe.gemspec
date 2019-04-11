
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ssframe/version"

Gem::Specification.new do |spec|
  spec.name          = "ssframe"
  spec.version       = Ssframe::VERSION
  spec.authors       = ["Viktoras Laukevičius"]
  spec.email         = ["viktoras.laukevicius@yahoo.com"]

  spec.summary       = "Easy way to frame your iOS app screenshots with a promo text!"
  spec.homepage      = "https://github.com/viktorasl/ssframe"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "mini_magick"
  spec.add_dependency "fastlane"
  
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.5'
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
end
