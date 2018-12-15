require 'faraday'
require 'football_data/api/Resources/areas'
require 'football_data/api/Resources/competitions'
require 'football_data/api/Resources/matches'
require 'football_data/api/Resources/players'
require 'football_data/api/Resources/teams'

module FootballData
  module Api
    class Client
      include FootballData::Api::Resources::Areas
      include FootballData::Api::Resources::Competitions
      include FootballData::Api::Resources::Matches
      include FootballData::Api::Resources::Players
      include FootballData::Api::Resources::Teams

      def initialize
        @connection = Faraday.new(url: FootballData::Api::BASE_URL)
      end

      private

      def make_request(url, params = {})
        response = @connection.get do |req|
          req.url url
          req.headers['X-Auth-Token'] = FootballData::Api.auth_token
          params.each { |key, value| req.params[key.to_s] = value }
        end

        analyse_response(response)

        JSON.parse(response.body)
      end

      def analyse_response(response)
        return if response.status.to_s.starts_with?('2')

        msg = JSON.parse(response.body)['ErrorMessage']

        raise(FootballData::RequestError, msg.is_a?(Array) ? msg[0] : msg.to_s)
      end
    end
  end
end
