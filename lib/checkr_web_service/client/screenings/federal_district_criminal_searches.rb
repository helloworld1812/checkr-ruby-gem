module CheckrWebService
  class Client
    module Screenings
      module FederalDistrictCriminalSearches
        def federal_district_criminal_search(id, options={})
          get "federal_district_criminal_searches/#{id}", options
        end
      end
    end
  end
end
