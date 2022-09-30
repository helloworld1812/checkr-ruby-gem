module CheckrWebService
  class Client
    module Nodes
      def nodes(options={})
        paginate "nodes", options
      end
    end
  end
end
