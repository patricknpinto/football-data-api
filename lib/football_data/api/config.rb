module FootballData
  module Api
    BASE_URL = 'https://api.football-data.org/v2'.freeze

    cattr_accessor :auth_token

    def self.configure
      yield self
    end
  end
end
