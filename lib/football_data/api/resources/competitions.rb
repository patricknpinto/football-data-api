module FootballData
  module Api
    module Resources
      module Competitions
        def competitions(params = {})
          make_request('competitions', params)
        end

        def competition(id, params = {})
          make_request("competitions/#{id}", params)
        end

        def competition_teams(id, params = {})
          make_request("competitions/#{id}/teams", params)
        end

        def competition_standings(id, params = {})
          make_request("competitions/#{id}/standings", params)
        end

        def competition_matches(id, params = {})
          make_request("competitions/#{id}/matches", params)
        end

        def competition_scorers(id, params = {})
          make_request("competitions/#{id}/scorers", params)
        end
      end
    end
  end
end
