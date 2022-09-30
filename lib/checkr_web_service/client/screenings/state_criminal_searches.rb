module CheckrWebService
  class Client
    module Screenings
      module StateCriminalSearches
        def state_criminal_search(id, options={})
          get "state_criminal_searches/#{id}", options
        end
      end
    end
  end
end
