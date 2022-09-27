module CheckrWebService
  class Client
    module Nodes
      def nodes(options={})
        get "nodes", options
      end
    end
  end
end
