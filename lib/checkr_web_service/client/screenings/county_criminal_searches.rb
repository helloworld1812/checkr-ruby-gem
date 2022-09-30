module CheckrWebService
  class Client
    module Screenings
      module CountyCriminalSearches
        def county_criminal_search(id, options={})
          get "county_criminal_searches/#{id}", options
        end
      end
    end
  end
end
