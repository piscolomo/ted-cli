require_relative 'lib/ted-cli/version'

Gem::Specification.new do |s|
  s.name              = "ted-cli"
  s.version           = TedCli::VERSION
  s.summary           = "Command Line Interface gem for explore and watch Ted talks."
  s.description       = "Command Line Interface gem for explore and watch Ted talks."
  s.authors           = ["Julio Lopez"]
  s.email             = ["ljuliom@gmail.com"]
  s.homepage          = "http://github.com/TheBlasfem/ted-cli"
  s.files = Dir[
    "LICENSE",
    "README.md",
    "lib/**/*.rb",
    "*.gemspec",
    "test/**/*.rb"
  ]
  s.license           = "MIT"
  s.add_development_dependency "cutest", "1.1.3"
  s.add_runtime_dependency 'commander', '4.3.4'
  s.add_runtime_dependency "httparty", "~> 0.13"
  s.add_runtime_dependency 'paint', '1.0.0'
end