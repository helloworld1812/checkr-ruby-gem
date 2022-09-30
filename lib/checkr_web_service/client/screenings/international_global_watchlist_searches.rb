module CheckrWebService
  class Client
    module Screenings
      module InternationalGlobalWatchlistSearches
        def international_global_watchlist_search(id, options={})
          get "international_global_watchlist_searches/#{id}", options
        end
      end
    end
  end
end
