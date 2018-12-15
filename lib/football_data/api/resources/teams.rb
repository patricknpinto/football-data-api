module FootballData
  module Api
    module Resources
      module Teams
        def teams(params = {})
          make_request('teams', params)
        end

        def team(id, params = {})
          make_request("teams/#{id}", params)
        end

        def team_matches(id, params = {})
          make_request("teams/#{id}/matches", params)
        end
      end
    end
  end
end
