module CheckrWebService
  class Client
    module Screenings
      module SsnTraces
        def ssn_trace(id, options={})
          get "ssn_traces/#{id}", options
        end
      end
    end
  end
end
