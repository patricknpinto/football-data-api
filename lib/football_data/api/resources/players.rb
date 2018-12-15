module FootballData
  module Api
    module Resources
      module Players
        def players(params = {})
          make_request('players', params)
        end

        def player(id, params = {})
          make_request("players/#{id}", params)
        end

        def player_matches(id, params = {})
          make_request("players/#{id}/matches", params)
        end
      end
    end
  end
end
