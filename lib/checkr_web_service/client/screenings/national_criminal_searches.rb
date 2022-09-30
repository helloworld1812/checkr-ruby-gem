module CheckrWebService
  class Client
    module Screenings
      module NationalCriminalSearches
        def national_criminal_search(id, options={})
          get "national_criminal_searches/#{id}", options
        end
      end
    end
  end
end
