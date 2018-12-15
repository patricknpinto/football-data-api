module FootballData
  module Api
    module Resources
      module Areas
        def areas(params = {})
          make_request('areas', params)
        end

        def area(id, params = {})
          make_request("areas/#{id}", params)
        end
      end
    end
  end
end
