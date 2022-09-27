module CheckrWebService
    class Client
      module Candidates
        def candidates(options={})
          get "candidates", options
        end
      end
    end
  end
  