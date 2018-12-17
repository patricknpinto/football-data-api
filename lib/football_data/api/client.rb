require 'faraday'
require 'football_data/api/resources/areas'
require 'football_data/api/resources/competitions'
require 'football_data/api/resources/matches'
require 'football_data/api/resources/players'
require 'football_data/api/resources/teams'

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
