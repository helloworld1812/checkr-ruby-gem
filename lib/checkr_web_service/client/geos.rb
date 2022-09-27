module CheckrWebService
    class Client
      module Geos
        def geos(options={})
          get "geos", options
        end
      end
    end
  end
  