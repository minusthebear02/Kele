Gem::Specification.new do |s|
  s.name          = 'Kele'
  s.version       = '0.0.1'
  s.date          = '2017-07-26'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Mark Froehlich']
  s.email         = 'mfroeh2@gmail.com'
  s.files         = ['lib/kele.rb', 'lib/kele/roadmap.rb', 'lib/kele/message.rb', 'lib/kele/checkpoint.rb']
  s.require_paths = ["lib"]
  s.homepage      = 'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
end
