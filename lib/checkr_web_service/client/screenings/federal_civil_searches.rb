module CheckrWebService
  class Client
    module Screenings
      module FederalCivilSearches
        def federal_civil_search(id, options={})
          get "federal_civil_searches/#{id}", options
        end
      end
    end
  end
end