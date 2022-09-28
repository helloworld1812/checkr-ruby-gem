module CheckrWebService
    class Client
      module Invitations
        def invitations(options={})
          paginate "invitations", options
        end
      end
    end
  end
  