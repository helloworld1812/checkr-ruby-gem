module CheckrWebService
  class Client
    module Screenings
      module FederalDistrictCivilSearches
        def federal_district_civil_search(id, options={})
          get "federal_district_civil_searches/#{id}", options
        end
      end
    end
  end
end
