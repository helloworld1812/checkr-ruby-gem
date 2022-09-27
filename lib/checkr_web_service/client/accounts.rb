module CheckrWebService
  class Client
    module Accounts
      def account(options={})
        get "account", options
      end
    end
  end
end
