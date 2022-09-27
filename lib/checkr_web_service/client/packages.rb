module CheckrWebService
    class Client
      module Packages
        def packages(options={})
          get "packages", options
        end
      end
    end
  end
  