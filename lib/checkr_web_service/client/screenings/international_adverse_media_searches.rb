module CheckrWebService
  class Client
    module Screenings
      module InternationalAdverseMediaSearches
        def international_adverse_media_search(id, options={})
          get "international_adverse_media_searches/#{id}", options
        end
      end
    end
  end
end
