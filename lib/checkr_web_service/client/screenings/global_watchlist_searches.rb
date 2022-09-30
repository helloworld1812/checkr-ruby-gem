module CheckrWebService
  class Client
    module Screenings
      module GlobalWatchlistSearches
        def global_watchlist_search(id, options={})
          get "global_watchlist_searches/#{id}", options
        end
      end
    end
  end
end
