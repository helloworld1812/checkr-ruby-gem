module CheckrWebService
    class Client
      module Invitations
        def invitations(options={})
          get "invitations", options
        end
      end
    end
  end
  