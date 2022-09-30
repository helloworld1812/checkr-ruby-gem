module CheckrWebService
  class Client
    module Screenings
      module FederalCriminalSearches
        def federal_criminal_search(id, options={})
          get "federal_criminal_searches/#{id}", options
        end
      end
    end
  end
end
