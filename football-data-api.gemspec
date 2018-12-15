$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'football_data/api/version'

Gem::Specification.new do |s|
  s.name        = 'football-data-api'
  s.version     = FootballData::Api::VERSION
  s.authors     = ['Patrick Pinto']
  s.email       = ['hello@patricknpinto.com']
  s.homepage    = 'https://www.football-data.org'
  s.summary     = 'Client for football-data.org API'
  s.description = 'Client for football-data.org API'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'faraday', '< 1'

  s.add_development_dependency 'rubocop', '< 1'
end
