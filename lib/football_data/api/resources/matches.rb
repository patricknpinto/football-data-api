module FootballData
  module Api
    module Resources
      module Matches
        def matches(params = {})
          make_request('matches', params)
        end

        def match(id, params = {})
          make_request("matches/#{id}", params)
        end
      end
    end
  end
end
