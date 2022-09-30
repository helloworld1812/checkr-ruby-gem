module CheckrWebService
  class Client
    module Screenings
      module InternationalCriminalSearches
        def international_criminal_search(id, options={})
          get "international_criminal_searches/#{id}", options
        end
      end
    end
  end
end
