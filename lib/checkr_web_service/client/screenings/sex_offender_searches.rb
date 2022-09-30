module CheckrWebService
  class Client
    module Screenings
      module SexOffenderSearches
        def sex_offender_search(id, options={})
          get "sex_offender_searches/#{id}", options
        end
      end
    end
  end
end
